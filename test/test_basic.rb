
require 'test/helper'
require 'test/helper_pagify'

class TestBasic < TestPagify
  def test_basic
    pager = Pagify::BasicPager.new(
      :fetcher => lambda{ |offset, per_page|
        # if for rails,
        # Data.find :all, :offset => offset, :limit => per_page
        TestPagify.data[offset, per_page]
      },
      :counter => lambda{
        # if for rails,
        # Data.count
        TestPagify.data.size
      })

    for_pager pager
  end

end
