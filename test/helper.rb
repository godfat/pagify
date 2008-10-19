
require 'rubygems'
require 'minitest/unit'

require 'pagify'

MiniTest::Unit.autorun

if Gem::Version.new(RUBY_VERSION) < Gem::Version.new('1.8.7')
  class Symbol
    def to_proc
      lambda{ |*args| args.shift.__send__(self, *args) }
    end
  end
end
