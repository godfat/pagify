
if respond_to?(:require_relative, true)
  require_relative 'helper'
  require_relative 'helper_pagify'
  require_relative 'helper_model'
else
  require 'test/helper'
  require 'test/helper_pagify'
  require 'test/helper_model'
end

require 'pagify/active_record'

require 'tempfile'
db = Tempfile.new('pagify')
db.close

require 'sqlite3/sqlite3_native'
require 'sqlite3'

DataMapper.setup(:active_record, "sqlite3:#{db.path}")

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3', :database => db.path)

class TestActiveRecord < TestCase
  include PagifyCase
  def test_for_active_record
    for_pager Pagify::ActiveRecordPager.new(Topic)
  end

  class Topic
    class << self
      def count opts = {}
        101
      end
      def find all, opts = {}
        PagifyCase.data[opts[:offset], opts[:limit]]
      end
    end
  end

  class UserForActiveRecord
    include DataMapper::Resource
    def self.default_repository_name
      :active_record
    end
    property :id, Serial
    property :name, String
    storage_names[default_repository_name] = 'users'
    auto_migrate!
  end

  class PetForActiveRecord
    include DataMapper::Resource
    def self.default_repository_name
      :active_record
    end
    property :id, Serial
    property :name, String
    property :user_id, Integer, :required => false
    storage_names[default_repository_name] = 'pets'
    auto_migrate!
  end

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
