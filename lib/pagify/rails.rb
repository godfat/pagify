
module Pagify
  # rails paginator was provided for convenience,
  # it wraps Paginator for you, and you can just pass the model class to it.
  # you don't have to care about the fetcher and counter.
  # additionally, you can pass other options to rails paginator,
  # they would be used in find options. e.g.,
  #  RailsPaginator.new Model, :order => 'created_at DESC'
  # would invoke Model.find :all, :offset => ?, :limit => ?, order => 'created_at DESC'
  class RailsPaginator < Paginator
    # the model class that you passed in this paginator
    attr_reader :model_class
    def initialize model_class, per_page = 20, opts = {}
      @model_class = model_class
      super(lambda{ |offset, per_page|
        @model_class.find :all, opts.merge(:offset => offset, :limit => per_page)
      }, lambda{
        @model_class.count opts
      }, 20)
    end
    # it simply call super(page.to_i), so RailsPaginator also eat string.
    def page page; super page.to_i; end
    alias_method :[], :page
  end
end
