

if respond_to?(:require_relative, true)
  require_relative 'helper'
  require_relative 'helper_pagify'
  require_relative 'helper_model'
else
  require 'test/helper'
  require 'test/helper_pagify'
  require 'test/helper_model'
end

require 'pagify/data_mapper'

class TestDataMapper < TestCase
  include PagifyCase
  def test_for_data_mapper
    for_pager Pagify::DataMapperPager.new(Topic)
  end

  class Topic
    class << self
      def count opts = {}
        101
      end
      def all opts = {}
        PagifyCase.data[opts[:offset], opts[:limit]]
      end
      def query
        {}
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
    has n, :pets
  end

  class Pet
    include DataMapper::Resource
    property :id, Serial
    property :name, String
    belongs_to :user, :required => false
  end

  User.auto_migrate!
  Pet.auto_migrate!

  include SuiteForModel

  def all_pets_with_name_godfat user
    user.pets.all(:name => 'godfat')
  end

end
