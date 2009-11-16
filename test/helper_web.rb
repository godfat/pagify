
module WebCase
  def setup
    @data = (0..9).to_a.pagify(:per_page => 2, :page => 3)
  end

  def test_query_name
    assert_equal(:page, Pagify::Helper::HTML.setting[:query_name])
    assert_equal(:page, Pagify::ArrayPager.new([]).html.setting[:query_name])
  end

  def test_pagify_links
    assert_equal('<div class="pagination"><a href="/a/b?page=2">&lt; Previous</a> <a href="/a/b?page=4">Next &gt;</a><br /><a href="/a/b?page=1">&laquo; First</a> <a href="/a/b?page=2">2</a> 3 <a href="/a/b?page=4">4</a> <a href="/a/b?page=5">Last &raquo;</a></div>', pagify_links(@data))

    @data.pager.html.setting[:links_type] = :links

    assert_equal('<div class="pagination"><a href="/a/b?page=1">&laquo; First</a> <a href="/a/b?page=2">2</a> 3 <a href="/a/b?page=4">4</a> <a href="/a/b?page=5">Last &raquo;</a></div>', pagify_links(@data))
  end

  def test_custom_path
    assert_equal('<div class="pagination"><a href="XD?page=2">&lt; Previous</a> <a href="XD?page=4">Next &gt;</a><br /><a href="XD?page=1">&laquo; First</a> <a href="XD?page=2">2</a> 3 <a href="XD?page=4">4</a> <a href="XD?page=5">Last &raquo;</a></div>', pagify_links(@data){'XD'})
  end
end
