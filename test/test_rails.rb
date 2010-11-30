
if respond_to?(:require_relative, true)
  require_relative 'helper'
  require_relative 'helper_web'
else
  require 'test/helper'
  require 'test/helper_web'
end

require 'pagify/helper/rails'

class TestRails < TestCase
  include WebCase
  include ApplicationHelper
  # fake
  def request
    Struct.new(:path).new('/a/b')
  end
  def params
    {:page => 3}
  end
end
