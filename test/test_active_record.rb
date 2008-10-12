
require 'test/helper'

class TestActiveRecord < TestPagify
  class Topic
    class << self
      def count opts = {}
        101
      end
      def find all, opts = {}
        TestPagify.data[opts[:offset], opts[:limit]]
      end
    end
  end

  def test_for_active_record
    for_pager Pagify::ActiveRecordPager.new(Topic)
  end
end
