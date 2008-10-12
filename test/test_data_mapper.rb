
require 'test/helper'
require 'test/suite_for_model'

require 'pagify/dm'

class TestDataMapper < TestPagify
  def test_for_data_mapper
    for_pager Pagify::DataMapperPager.new(Topic)
  end

  class Topic
    class << self
      def count opts = {}
        101
      end
      def all opts = {}
        TestPagify.data[opts[:offset], opts[:limit]]
      end
      def query
        nil
      end
      private
      def with_scope query
        yield
      end
    end
  end

  DataMapper.setup(:default, 'sqlite3::memory:')

  class User
    include DataMapper::Resource
    property :id, Serial
    property :name, String
    auto_migrate!

    create :name => 'A'
    create :name => 'A'
    create :name => 'B'
  end
  def model; User; end

  include SuiteForModel
end
