
# you'll need activerecord to use ActiveRecordPager

module Pagify
  # active_record paginator was provided for convenience,
  # it wraps Paginator for you, and you can just pass the model class to it.
  # you don't have to care about the fetcher and counter.
  # additionally, you can pass other options to rails paginator,
  # they would be used in find options. e.g.,
  #  ActiveRecordPaginator.new Model, :order => 'created_at DESC'
  # would invoke Model.find :all, :offset => ?, :limit => ?, order => 'created_at DESC'
  class ActiveRecordPager < BasicPager
    include PageAcceptStringOrBlank
    # the model class that you passed in this paginator
    attr_reader :model

    def initialize model_class, opts = {}
      @model = model_class
      query_opts = reject_pager_opts(opts)

      super(opts.merge(
        :fetcher => lambda{ |offset, per_page|
          model.find(:all, query_opts.merge(:offset => offset, :limit => per_page))
        },
        :counter => lambda{
          model.count(query_opts)
        }))
    end

    def page n
      if n.nil? || n == ''
        n = 1
      else
        n = n.to_i
      end
      super(n)
    end

  end

end
