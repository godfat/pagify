
module Pagify
  # array paginator would just simply assume your data is an array,
  # and create pages simply for your_data[offset, per_page]
  # if your data is much more complex, use Paginator instead of this
  class ArrayPager < BasicPager
    attr_reader :data

    # data that you passed in this paginator
    def initialize data, opts = {}
      @data = data
      super(opts.merge(
        :fetcher => lambda{ |offset, per_page|
          data[offset, per_page]
        },
        :counter => lambda{
          data.size
        }))
    end

  end
end

class Array
  include Pagify::Pagifier
  def pagify_pager_create model, opts
    Pagify::ArrayPager.new model, opts
  end
end
