
require 'test/helper'
require 'pagify/array'
require 'pagify/helper/rails'

class TestRails < TestCase
  include ApplicationHelper
  # fake
  def request
    Struct.new(:path).new('/a/b')
  end
  def params
    {:page => 3}
  end

  def setup
    @data = (0..9).to_a.pagify(:per_page => 2, :page => 3)
  end

  def test_query_name
    assert_equal(:page, Pagify::Helper::HTML.setting[:query_name])
    assert_equal(:page, Pagify::ArrayPager.new([]).html.setting[:query_name])
  end

  def test_would_paginate
    assert_equal('<div class="pagination"><a href="/a/b?page=2">&lt; Previous</a> <a href="/a/b?page=4">Next &gt;</a><br /><a href="/a/b?page=1">&laquo; First</a> <a href="/a/b?page=2">2</a> 3 <a href="/a/b?page=4">4</a> <a href="/a/b?page=5">Last &raquo;</a></div>', would_paginate(@data))

    @data.pager.html.setting[:links_type] = :links

    assert_equal('<div class="pagination"><a href="/a/b?page=1">&laquo; First</a> <a href="/a/b?page=2">2</a> 3 <a href="/a/b?page=4">4</a> <a href="/a/b?page=5">Last &raquo;</a></div>', would_paginate(@data))
  end

  def test_custom_path
    assert_equal('<div class="pagination"><a href="XD?page=2">&lt; Previous</a> <a href="XD?page=4">Next &gt;</a><br /><a href="XD?page=1">&laquo; First</a> <a href="XD?page=2">2</a> 3 <a href="XD?page=4">4</a> <a href="XD?page=5">Last &raquo;</a></div>', would_paginate(@data){'XD'})
  end
end
