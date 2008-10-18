
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

    pager2.html.class.setting[:outer_links] = 3
    assert_equal 3, pager1.html.setting[:outer_links]
    assert_equal 3, pager2.html.setting[:outer_links]

    pager1.html.setting[:outer_links] = 4
    assert_equal 4, pager1.html.setting[:outer_links]
    assert_equal 3, pager2.html.setting[:outer_links]

    pager1.html.setting.restore_default!
    assert_equal ' ', pager1.html.setting[:separator]
    assert_equal 4,   pager1.html.setting[:inner_links]
    assert_equal 6,   pager2.html.setting[:inner_links]
    assert_equal 3, pager1.html.setting[:outer_links]
    assert_equal 3, pager2.html.setting[:outer_links]

    pager2.html.class.setting.restore_default!
    assert_equal 6, pager2.html.setting[:inner_links]
    assert_equal 2, pager1.html.setting[:outer_links]
    assert_equal 2, pager2.html.setting[:outer_links]
  end

  def test_generate_html
    skip 'not implemented'

    pager = Pagify::ArrayPager.new((1..1000).to_a, :per_page => 10)

    assert_equal('<a href="49">&lt; Previous</a> 50 <a href="51">Next &gt;</a><br />'+
                 '<a href="1">&laquo; First</a> ' +
                 '<a href="2">2</a> ' + # outer links
                 '... ' +
                 '<a href="31">31</a> ' + # step links, offset = step * step
                 '... ' +
                 '<a href="40">40</a> ' + # step links, amount = inner / 2
                 '<a href="43">43</a> ' +
                 '... ' +
                 '<a href="46">46</a> ' + # inner links
                 '<a href="47">47</a> ' +
                 '<a href="48">48</a> ' +
                 '<a href="49">49</a> ' +
                 '50 ' +
                 '<a href="51">51</a> ' +
                 '<a href="52">52</a> ' +
                 '<a href="53">53</a> ' +
                 '<a href="54">54</a> ' + # inner links
                 '... ' +
                 '<a href="57">57</a> ' +
                 '<a href="60">60</a> ' + # step links, amount = inner / 2
                 '... ' +
                 '<a href="69">69</a> ' + # step links, offset = step * step
                 '... ' +
                 '<a href="99">99</a> ' + # outer links
                 '<a href="100">Last &raquo;</a>', pager[50].html.links)
  end

end
