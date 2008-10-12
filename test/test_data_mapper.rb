
require 'test/helper'

class TestDataMapper < TestPagify
  class Topic
    class << self
      def count opts = {}
        101
      end
      def all opts = {}
        TestPagify.data[opts[:offset], opts[:limit]]
      end
    end
  end

  def test_for_data_mapper
    for_pager Pagify::DataMapperPager.new(Topic)
  end
end
