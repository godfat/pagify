
module Pagify
  # pager is something help you paginate the data,
  # through the fetcher and counter you pass in.
  # e.g., for a array, the fetcher would be array[offset, per_page],
  # the counter would be array.size. and for data mapper's resource,
  # fetcher would be Model.all :offset => offset, :limit => per_page.
  # see ArrayPager and DataMapperPager, ActiveRecordPager, etc.
  # if you just simply need them or have a look at the source code
  # for example usage for Pager.
  class BasicPager
    include Enumerable
    attr_reader :fetcher, :counter
    attr_accessor :opts

    [:per_page, :null_page].each{ |attr|
      define_method(attr) do
        opts[attr]
      end

      define_method("#{attr}=") do |new_value|
        opts[attr] = new_value
      end
    }

    #  fetcher is function that fetch the data,
    #  counter is function that count the data,
    #  null_page indicates that pager sohuld
    # the default per_page is 20. you can reset per_page property later.
    def initialize opts = {}
      raise ArgumentError.new('missing fetcher and/or counter.') if
        !opts[:fetcher] || !opts[:counter]

      raise ArgumentError.new('fetcher or counter does not respond to call.') if
        !opts[:fetcher].respond_to?(:call) || !opts[:counter].respond_to?(:call)

      @opts     = {}
      @fetcher  = opts[:fetcher]
      @counter  = opts[:counter]

      self.per_page  = opts[:per_page]  || 20
      self.null_page = opts[:null_page] || false
    end

    # return a null pager that stubs anything to 0
    def self.null; NullPager.instance; end

    # if two paginators are equal, then the properties of
    # per_page, fetcher, counter are all equal.
    def == rhs
      self.per_page == rhs.per_page and
      self.fetcher  == rhs.fetcher  and
      self.counter  == rhs.counter
    end

    # for each page...
    def each; 1.upto(size){ |i| yield page(i) }; end

    # return all pages in an array
    def to_a; map{ |e| e }; end
    alias_method :pages, :to_a

    # create page instance by page number.
    # if page number you specified was not existed,
    # nil would be returned. note, page start at 1, not zero.
    def page page
      offset = (page - 1) * per_page
      if page <= 0 || offset >= entries_count
        if null_page
          return BasicPage.null
        else
          return nil
        end

      else
        return BasicPage.new self, page
      end

    end
    alias_method :[], :page

    # return the amount of pages
    def size; (entries_count / per_page.to_f).ceil; end

    # simply call @counter.call
    def entries_count; counter.call; end

    # get the offset property about the page.
    # it is simply (page-1)*@per_page
    def offset page
      (page - 1) * per_page
    end

    protected
    def reject_pager_opts opts
      opts.reject{ |key, value| [:per_page, :null_page].member?(key) }
    end
  end
end
