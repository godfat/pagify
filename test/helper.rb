
require 'rubygems'

TestCase = begin
             require 'minitest/unit'
             MiniTest::Unit.autorun
             MiniTest::Unit::TestCase
           rescue LoadError
             require 'test/unit'
             Test::Unit::TestCase
           end

require 'pagify'
require 'dm-core'
require 'dm-aggregates'
require 'dm-migrations'
require 'active_record'
