
# you'll need dm-core and dm-aggregates to use DataMapperPager

module Pagify

  class DataMapperPager < BasicPager
    attr_reader :model

    def initialize model_class, opts = {}, query = {}
      @model = model_class
      query ||= {}
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

    # it simply call super(page.to_i), so ActiveRecordPaginator also eat string.
    def page page; super page.to_i; end

  end

end
