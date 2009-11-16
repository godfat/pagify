
require 'test/helper'
require 'test/helper_pagify'

class TestBasic < PagifyCase
  def test_basic
    pager = Pagify::BasicPager.new(
      :fetcher => lambda{ |offset, per_page|
        # if for rails,
        # Data.find :all, :offset => offset, :limit => per_page
        PagifyCase.data[offset, per_page]
      },
      :counter => lambda{
        # if for rails,
        # Data.count
        PagifyCase.data.size
      })

    for_pager pager
  end

end
