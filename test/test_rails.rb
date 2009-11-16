
require 'test/helper'
require 'test/helper_web'
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
