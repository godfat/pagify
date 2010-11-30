
if respond_to?(:require_relative, true)
  require_relative 'helper'
  require_relative 'helper_pagify'
else
  require 'test/helper'
  require 'test/helper_pagify'
end

class TestArray < TestCase
  include PagifyCase
  def test_offset_bug
    a = (0..9).to_a
    pager = Pagify::ArrayPager.new a
    pager.per_page = 5
    assert_equal 5, pager[1].size
    assert_equal 5, pager[2].size
    assert_equal Pagify::NullPage.new(pager),  pager[3]
  end

  def test_for_array
    for_pager Pagify::ArrayPager.new(PagifyCase.data)
  end

end
