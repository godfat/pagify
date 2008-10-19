
require 'test/helper'
require 'test/test_pagify'

class TestArray < TestPagify
  def test_offset_bug
    a = (0..9).to_a
    pager = Pagify::ArrayPager.new a
    pager.per_page = 5
    assert_equal 5, pager[1].size
    assert_equal 5, pager[2].size
    assert_nil pager[3]
  end

  def test_for_array
    for_pager Pagify::ArrayPager.new(TestPagify.data)
  end

end
