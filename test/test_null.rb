
require 'test/helper'

class TestNull < MiniTest::Unit::TestCase
  def test_null_pager
    nullpage = Pagify::NullPage.instance
    assert_equal 0, nullpage.page
    assert_nil nullpage.next
    assert_equal 0, nullpage.size
    assert_equal [], nullpage.data
    assert_equal nullpage.object_id, nullpage.pager.page(0).object_id

    assert_nil Pagify::BasicPager.null.page(1)
    assert_equal nullpage.object_id, Pagify::BasicPage.null.object_id

    dummy_pager = Pagify::BasicPager.new(:null_page => true,
      :fetcher => lambda{|*a|[]}, :counter => lambda{0})

    assert_equal nullpage.object_id, dummy_pager.page(1).object_id
  end

end
