
require 'singleton'

module Pagify
  # a null paginator that stubs any page into a null page.
  class NullPager < BasicPager
    include Singleton
    def initialize
      super(:fetcher => lambda{|*a|[]}, :counter => lambda{0})
    end
    def page page; page == 0 ? NullPage.instance : nil; end
  end

  # a null page that stubs anything to 0 or [], etc.
  class NullPage < BasicPage
    include Singleton
    def initialize; super(NullPager.instance, 0); end
  end

end
