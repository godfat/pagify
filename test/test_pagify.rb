
require 'rubygems'
require 'minitest/unit'

require 'pagify'

MiniTest::Unit.autorun

if Gem::Version.new(RUBY_VERSION) < Gem::Version.new('1.8.7')
  class Symbol
    def to_proc
      lambda{ |*args| args.shift.__send__(self, *args) }
    end
  end
end

class TestPagify < MiniTest::Unit::TestCase
  def self.data; @data ||= (0..100).to_a; end
  def for_pager pager
    # assume data.size is 101, data is [0,1,2,3...]
    pager.per_page = 10
    assert_equal 11, pager.size

    assert_nil pager[0]
    assert_equal((0..9).to_a, pager.page(1).to_a)
    assert_equal((10..19).to_a, pager[2].to_a)
    assert_equal(20, pager.page(3).first)
    assert_equal((90..99).to_a, pager[10].to_a)
    assert_equal([100], pager.page(11).to_a)
    assert_nil(pager.page(12))

    assert_equal(pager[1], pager[2].prev)
    assert_equal(pager.page(11), pager[10].next)
    assert_nil(pager[1].prev)
    assert_nil(pager[10].next.next)

    assert_equal pager[4].data, pager[4].fetch
    assert_equal(pager[1], pager.pages.first)
    assert_equal(pager[2], pager.to_a[1])
    assert_equal(5050, pager.inject(0){|r, i| r += i.inject(&:+) })

    assert_equal 4, pager[4].page

    assert_equal 10, pager[2].begin
    assert_equal 19, pager[2].end
    assert_equal 100, pager[11].end
  end
  def test_basic
    pager = Pagify::Paginator.new(
    lambda{ |offset, per_page|
      # if for rails,
      # Data.find :all, :offset => offset, :limit => per_page
      TestPagify.data[offset, per_page]
    }, lambda{
      # if for rails,
      # Data.count
      TestPagify.data.size
    })
    for_pager pager
  end
  def test_offset_bug
    a = (0..9).to_a
    pager = Pagify::ArrayPaginator.new a
    pager.per_page = 5
    assert_equal 5, pager[1].size
    assert_equal 5, pager[2].size
    assert_nil pager[3]
  end
  class Topic
    class << self
      def count opts = {}
        101
      end
      def find all, opts = {}
        TestPagify.data[opts[:offset], opts[:limit]]
      end
    end
  end
  def test_for_rails
    for_pager Pagify::RailsPaginator.new(Topic)
  end
  def test_for_array
    for_pager Pagify::ArrayPaginator.new(TestPagify.data)
  end
  def test_null_paginator
    nullpage = Pagify::NullPage.instance
    assert_equal 0, nullpage.page
    assert_nil nullpage.next
    assert_equal 0, nullpage.size
    assert_equal [], nullpage.data
    assert_equal nullpage.object_id, nullpage.pager.page(0).object_id
    assert_nil Pagify::Paginator.null.page(1)
    assert_equal nullpage.object_id, Pagify::Page.null.object_id
  end
end
