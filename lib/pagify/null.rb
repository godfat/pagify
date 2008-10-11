
require 'singleton'

module Pagify
  # a null paginator that stubs any page into a null page.
  class NullPaginator < Paginator
    include Singleton
    def initialize; super(lambda{|*a|[]}, lambda{0}); end
    def page page; page == 0 ? NullPage.instance : nil; end
  end

  # a null page that stubs anything to 0 or [], etc.
  class NullPage < Page
    include Singleton
    def initialize; super(NullPaginator.instance, 0); end
  end

end
