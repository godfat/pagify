
require 'test/helper'
require 'test/helper_web'
require 'pagify/helper/innate'

class TestInnate < TestCase
  include WebCase
  include Innate::Helper::Pagify
  # fake
  def request
    Struct.new(:path, :page).new('/a/b', 3)
  end
end
