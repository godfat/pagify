
require 'test/helper'

require 'pagify/helpers/html'

class TestHTML < MiniTest::Unit::TestCase
  # def test_page_and_pager_has_same_html
  #   pager = Pagify::ArrayPager.new [1]
  #   assert_equal pager.html.object_id, pager[1].html.object_id
  # end

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
    # skip 'not implemented'

    pager = Pagify::ArrayPager.new((1..1000).to_a, :per_page => 10)
    users = pager[50]

    assert_equal(#'<a href="49">&lt; Previous</a> 50 <a href="51">Next &gt;</a><br />'+
                 '<a href="1">&laquo; First</a> ' +
                 '<a href="2">2</a> ' + # outer links
                 # '... ' +
                 # '<a href="31">31</a> ' + # step links, offset = step * step
                 # '... ' +
                 # '<a href="40">40</a> ' + # step links, amount = inner / 2
                 # '<a href="43">43</a> ' +
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
                 # '<a href="57">57</a> ' +
                 # '<a href="60">60</a> ' + # step links, amount = inner / 2
                 # '... ' +
                 # '<a href="69">69</a> ' + # step links, offset = step * step
                 # '... ' +
                 '<a href="99">99</a> ' + # outer links
                 '<a href="100">Last &raquo;</a>',
                 users.pager.html.links(50, &:to_s) )
  end

  def test_with_class
    pager = Pagify::ArrayPager.new((1..1000).to_a, :per_page => 10)
    pager.html.setting[:class] = 'pagify'
    pager.html.setting[:separator] = ',,'
    pager.html.setting[:ellipsis] = 'zzz'
    users = pager[50]

    assert_equal(#'<a href="49">&lt; Previous</a> 50 <a href="51">Next &gt;</a><br />'+
                 '<a href="1" class="pagify">&laquo; First</a>,,' +
                 '<a href="2" class="pagify">2</a>,,' + # outer links
                 'zzz,,' +
                 '<a href="46" class="pagify">46</a>,,' + # inner links
                 '<a href="47" class="pagify">47</a>,,' +
                 '<a href="48" class="pagify">48</a>,,' +
                 '<a href="49" class="pagify">49</a>,,' +
                 '50,,' +
                 '<a href="51" class="pagify">51</a>,,' +
                 '<a href="52" class="pagify">52</a>,,' +
                 '<a href="53" class="pagify">53</a>,,' +
                 '<a href="54" class="pagify">54</a>,,' + # inner links
                 'zzz,,' +
                 '<a href="99" class="pagify">99</a>,,' + # outer links
                 '<a href="100" class="pagify">Last &raquo;</a>',
                 users.pager.html.links(50, &:to_s) )
  end

  def test_no_page
    pager = Pagify::ArrayPager.new([1], :per_page => 10)
    nothing_there pager
    pager.html.setting[:outer_links] = 10
    nothing_there pager
    pager.html.setting[:inner_links] = 1
    nothing_there pager
    pager.html.setting[:inner_links] = 5
    nothing_there pager
  end

  def nothing_there pager
    assert_equal('', pager.html.links(1, &:to_s))
  end

  def test_nothing
    pager = Pagify::ArrayPager.new([1,2,3])
    assert_equal '', pager.html.links_navigate(1, &:to_s)
  end

  def test_null_pager
    pager = Pagify::NullPager.instance
    assert_equal '', pager.html.links(1)
    assert_equal '', pager.html.links(nil)
    assert_equal '', pager.html.links('')
    assert_equal '', pager.html.links(2)
    assert_equal '', pager.html.links(-1)
  end

  def test_2_pages
    pager = Pagify::ArrayPager.new([1,2,3], :per_page => 2)
    assert_equal '&laquo; First <a href="2">Last &raquo;</a>', pager.html.links(1, &:to_s)
    assert_equal '<a href="1">&laquo; First</a> Last &raquo;', pager.html.links(2, &:to_s)

    assert_equal '<a href="2">Next &gt;</a>', pager.html.links_navigate(1, &:to_s)
    assert_equal '<a href="1">&lt; Previous</a>', pager.html.links_navigate(2, &:to_s)
  end

  def test_3_pages
    pager = Pagify::ArrayPager.new([1,2,3,4,5], :per_page => 2)

    assert_equal '&laquo; First <a href="2">2</a> <a href="3">Last &raquo;</a>',
      pager.html.links(1, &:to_s)

    assert_equal '<a href="1">&laquo; First</a> 2 <a href="3">Last &raquo;</a>',
      pager.html.links(2, &:to_s)

    assert_equal '<a href="1">&laquo; First</a> <a href="2">2</a> Last &raquo;',
      pager.html.links(3, &:to_s)

    assert_equal '<a href="2">Next &gt;</a>', pager.html.links_navigate(1, &:to_s)

    assert_equal '<a href="1">&lt; Previous</a> <a href="3">Next &gt;</a>',
      pager.html.links_navigate(2, &:to_s)

    assert_equal '<a href="2">&lt; Previous</a>', pager.html.links_navigate(3, &:to_s)
  end

  def test_more_pages_to_left_or_right
    pager = Pagify::ArrayPager.new((1..33).to_a, :per_page => 3)

    first = ['&laquo; First', '<a href="1">&laquo; First</a>']
    last  = ['Last &raquo;',  '<a href="11">Last &raquo;</a>']

    (1..11).each{ |page|
      expected = (2..10).map{ |i| i == page ? i.to_s : "<a href=\"#{i}\">#{i}</a>" }

      expected.unshift( page == 1  ? first.first : first.last )
      expected.push(    page == 11 ?  last.first :  last.last )

      assert_equal expected.join(' '), pager.html.links(page, &:to_s)
    }

  end

end
