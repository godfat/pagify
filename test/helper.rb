
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

if Gem::Version.new(RUBY_VERSION) < Gem::Version.new('1.8.7')
  class Symbol
    def to_proc
      lambda{ |*args| args.shift.__send__(self, *args) }
    end
  end
end
