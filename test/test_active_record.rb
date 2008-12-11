
require 'test/helper'
require 'test/suite_for_model'

require 'pagify/active_record'

gem 'dm-core', '<=0.9.7'
require 'dm-core' # to help with active record to create database

class TestActiveRecord < TestPagify
  def test_for_active_record
    for_pager Pagify::ActiveRecordPager.new(Topic)
  end

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

  # i am tired with active record!!
  DataMapper.setup :active_record, 'sqlite3:tmp/active_record.sqlite3'
  class UserForActiveRecord
    include DataMapper::Resource
    property :id, Serial
    property :name, String
    def self.default_repository_name
      :active_record
    end
    # why can't i use:
    storage_name = 'users'
    # end why
    storage_names[default_repository_name] = 'users'
    auto_migrate!
  end

  class PetForActiveRecord
    include DataMapper::Resource
    property :id, Serial
    property :name, String
    property :user_id, Integer
    def self.default_repository_name
      :active_record
    end
    storage_names[default_repository_name] = 'pets'
    auto_migrate!
  end

  ActiveRecord::Base.establish_connection(
    :adapter => 'sqlite3', :database => 'tmp/active_record.sqlite3')

  class User < ActiveRecord::Base
    has_many :pets
  end

  class Pet < ActiveRecord::Base
    belongs_to :user
  end

  include SuiteForModel

  def all_pets_with_name_godfat user
    user.pets.all(:conditions => ['name = ?', 'godfat'])
  end

end
