
require 'test/helper'
require 'test/suite_for_model'

require 'pagify/ar'

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
  DataMapper.setup :active_record, 'sqlite3:active_record.sqlite3'
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

  class User < ActiveRecord::Base
    establish_connection :adapter => 'sqlite3', :database => 'active_record.sqlite3'

    create :name => 'A'
    create :name => 'A'
    create :name => 'B'
  end
  def model; User; end

  include SuiteForModel
end
