
if respond_to?(:require_relative, true)
  require_relative 'helper'
else
  require 'test/helper'
end

class TestNull < TestCase
  def test_null_pager
    null = Pagify::NullPager.instance.page(0)
    for_null_page(null)

    assert_equal(null.object_id, Pagify::NullPager.instance.page(1).object_id)
    assert_equal(null.pager.object_id, Pagify::NullPage.new.pager.object_id)

    dummy_pager = Pagify::BasicPager.new(:null_page => true,
      :fetcher => lambda{|*a|[]}, :counter => lambda{0})

    assert_equal(Pagify::NullPage.new(dummy_pager), dummy_pager.page(1))
  end

  def test_null_page_from_array_pager
    for_null_page(Pagify::ArrayPager.new([]).page(2))
  end

  def for_null_page null
    assert_equal(0, null.page)
    assert_equal(null.object_id, null.next.object_id)
    assert_equal(0, null.size)
    assert_equal([], null.data)
    assert_equal(null.object_id, null.pager.page(0).object_id)
    assert_equal(true, null.empty?)
  end

end
