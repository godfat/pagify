
require 'rubygems'
require 'minitest/unit'
MiniTest::Unit.autorun

require 'pagify'

if Gem::Version.new(RUBY_VERSION) < Gem::Version.new('1.8.7')
  class Symbol
    def to_proc
      lambda{ |*args| args.shift.__send__(self, *args) }
    end
  end
end
