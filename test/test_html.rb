
require 'pagify'
require 'pagify/helpers/html'

class TestHTML < MiniTest::Unit::TestCase
  def test_html
    pager1 = Pagify::ArrayPager.new []
    assert_equal ' ', pager1.html.setting[:separator]
    assert_equal Pagify::Helpers::HTML.object_id, pager1.html.class.object_id

    pager1.html.setting[:separator] = 'XD'
    assert_equal 'XD', pager1.html.setting[:separator]
    assert_equal ' ',  pager1.html.class.setting[:separator]

    pager2 = Pagify::ArrayPager.new []
    assert_equal ' ',  pager2.html.setting[:separator]

    pager2.html.setting[:inner_links] = 6
    assert_equal 6, pager2.html.setting[:inner_links]
    assert_equal 4, pager1.html.setting[:inner_links]
    assert_equal 4, pager2.html.class.setting[:inner_links]

    pager2.html.class.setting[:outer_links] = 2
    assert_equal 2, pager1.html.setting[:outer_links]
    assert_equal 2, pager2.html.setting[:outer_links]

    pager1.html.setting[:outer_links] = 3
    assert_equal 3, pager1.html.setting[:outer_links]
    assert_equal 2, pager2.html.setting[:outer_links]
  end

end
