
module Pagify

  # a null paginator that stubs any page into a null page.
  class NullPager < BasicPager
    include Singleton
    def initialize
      super(:fetcher => lambda{|*a|[]}, :counter => lambda{0})
    end
    def page page; page == 0 ? NullPage.instance : nil; end

    private
    def normalize_page n
      0
    end
  end

end # of Pagify
