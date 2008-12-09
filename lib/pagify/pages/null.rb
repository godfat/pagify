
module Pagify

  # a null page that stubs anything to 0 or [], etc.
  class NullPage < BasicPage
    include Singleton
    def initialize
      super(NullPager.instance, 0)
      @data = []
    end
  end

end # of Pagify
