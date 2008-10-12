
module Pagify
  # which was produced by Paginator#page / Paginator#[],
  # representing page that contained target data.
  # it would use lazy fetching, whenever you need the data,
  # the fetcher would be invoked that time. whenever the data
  # was fetched, it won't fetch again. it you need refetch,
  # call Page#fetch
  class BasicPage
    # prvent Page#to_a return [#<Page:0x12345>]
    undef_method :to_a if Gem::Version.new(RUBY_VERSION) < Gem::Version.new('1.9.0')

    # pager to get the original pager; page to get the number of this page
    attr_reader :pager, :page

    # don't create a page instance yourself unless you have to
    def initialize pager, page; @pager, @page = pager, page; end

    # return a null page that stubs anything to 0
    def self.null; NullPage.instance; end

    # return the page instance next to this page
    def next; pager.page(page + 1); end

    # return the page instance prev to this page
    def prev; pager.page(page - 1); end

    # if the page numbers and the pagers are equal,
    # then the pages are equal.
    def == rhs
      page  == rhs.page and
      pager == rhs.pager
    end

    # explicitly fetch the data from pager
    def fetch; @data = pager.fetcher[self.begin, pager.per_page]; end

    # get the data fetched from pager
    def data; @data ||= fetch; end

    # the real beginning index
    def begin; pager.offset page; end

    # the real ending index (need fetch, because we don't know the size)
    def end; self.begin + self.size - 1; end

    # any other method call would delegate to the data,
    # e.g., each, to_a, map, first, method_you_defined, etc.
    def method_missing msg, *args, &block
      if data.respond_to?(msg)
        data.__send__(msg, *args, &block)
      else
        super(msg, *args, &block)
      end
    end

  end
end
