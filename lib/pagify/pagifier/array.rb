
require 'pagify/pagifier/abstract'

class Array
  include Pagify::Pagifier
  def pagify_pager_create model, opts
    Pagify::ArrayPager.new model, opts
  end
end
