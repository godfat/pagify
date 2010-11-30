
if respond_to?(:require_relative, true)
  require_relative 'helper'
  require_relative 'helper_web'
else
  require 'test/helper'
  require 'test/helper_web'
end

require 'pagify/helper/innate'

class TestInnate < TestCase
  include WebCase
  include Innate::Helper::Pagify
  # fake
  def request
    Struct.new(:path, :page).new('/a/b', 3)
  end
end
