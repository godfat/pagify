
require 'test/helper'

class TestNull < TestCase
  def test_null_pager
    nullpage = Pagify::NullPager.instance.page(0)
    assert_equal 0, nullpage.page
    assert_equal nullpage.object_id, nullpage.next.object_id
    assert_equal 0, nullpage.size
    assert_equal [], nullpage.data
    assert_equal nullpage.object_id, nullpage.pager.page(0).object_id

    assert_equal nullpage.object_id, Pagify::NullPager.instance.page(1).object_id
    assert_equal nullpage.pager.object_id, Pagify::NullPage.new.pager.object_id

    dummy_pager = Pagify::BasicPager.new(:null_page => true,
      :fetcher => lambda{|*a|[]}, :counter => lambda{0})

    assert_equal Pagify::NullPage.new(dummy_pager), dummy_pager.page(1)
  end

end
