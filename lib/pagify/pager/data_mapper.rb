
# you'll need dm-core and dm-aggregates to use DataMapperPager

module Pagify

  class DataMapperPager < BasicPager
    include PageAcceptStringOrBlank
    attr_reader :model

    def initialize model_class, opts = {}, query = {}
      @model = model_class
      query_opts = reject_pager_opts(opts)

      super(opts.merge(
        :fetcher => lambda{ |offset, per_page|
          model.send :with_scope, query do
            model.all(query_opts.merge(:offset => offset, :limit => per_page))
          end
        },
        :counter => lambda{
          model.send :with_scope, query do
            model.count(query_opts)
          end
        }))
    end

  end # of DataMapperPager
end # of Pagify
