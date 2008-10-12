
module Pagify

  class DataMapperPager < BasicPager
    attr_reader :model_class

    def initialize model_class, opts = {}
      @model_class = model_class
      super(opts.merge(
        :fetcher => lambda{ |offset, per_page|
          model_class.all(opts.merge(:offset => offset, :limit => per_page))
        },
        :counter => lambda{
          model_class.count(opts)
        }))
    end

    # it simply call super(page.to_i), so ActiveRecordPaginator also eat string.
    def page page; super page.to_i; end

  end
end
