
module Pagify
  # array paginator would just simply assume your data is an array,
  # and create pages simply for your_data[offset, per_page]
  # if your data is much more complex, use Paginator instead of this
  class ArrayPaginator < Paginator
    # data that you passed in this paginator
    attr_reader :data
    def initialize data, per_page = 20
      @data = data
      super(lambda{ |offset, per_page|
        @data[offset, per_page]
      }, lambda{
        @data.size
      }, per_page)
    end
  end
end
