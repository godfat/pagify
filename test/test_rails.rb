
require 'test/helper'
require 'pagify/array'
require 'pagify/helper/rails'

class TestRails < TestCase
  include ApplicationHelper
  def request
    Struct.new(:path).new('/a/b')
  end
  def params
    {:page => 3}
  end

  def test_query_name
    assert_equal(:page, Pagify::Helper::HTML.setting[:query_name])
    assert_equal(:page, Pagify::ArrayPager.new([]).html.setting[:query_name])
  end

  def test_would_paginate
    data = (0..9).to_a.pagify(:per_page => 2, :page => 3)
    assert_equal('<div class="pagination"><a href="/a/b?page=2">&lt; Previous</a> <a href="/a/b?page=4">Next &gt;</a><br /><a href="/a/b?page=1">&laquo; First</a> <a href="/a/b?page=2">2</a> 3 <a href="/a/b?page=4">4</a> <a href="/a/b?page=5">Last &raquo;</a></div>', would_paginate(data))
  end
end
