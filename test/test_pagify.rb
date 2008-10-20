
require 'test/helper'

class TestPagify < MiniTest::Unit::TestCase
  def self.data; @data ||= (0..100).to_a; end
  def for_pager pager
    # assume data.size is 101, data is [0,1,2,3...]
    pager.per_page = 10
    assert_equal 11, pager.size

    assert_equal Pagify::NullPage.instance.object_id, pager[0].object_id
    assert_equal((0..9).to_a, pager.page(1).to_a)
    assert_equal((10..19).to_a, pager[2].to_a)
    assert_equal(20, pager.page(3).first)
    assert_equal((90..99).to_a, pager[10].to_a)
    assert_equal([100], pager.page(11).to_a)
    assert_equal Pagify::NullPage.instance.object_id, pager.page(12).object_id

    assert_equal(pager[1], pager[2].prev)
    assert_equal(pager.page(11), pager[10].next)
    assert_equal Pagify::NullPage.instance.object_id, pager[1].prev.object_id
    assert_equal Pagify::NullPage.instance.object_id, pager[10].next.next.object_id

    assert_equal pager[4].data, pager[4].fetch
    assert_equal(pager[1], pager.pages.first)
    assert_equal(pager[2], pager.to_a[1])
    assert_equal(5050, pager.inject(0){|r, i| r += i.inject(&:+) })

    assert_equal 4, pager[4].page

    assert_equal 10, pager[2].begin
    assert_equal 19, pager[2].end
    assert_equal 100, pager[11].end

    pager.null_page = false

    assert_nil pager[12]
  end
end
