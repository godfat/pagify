
module Pagify
  # a null page that stubs anything to 0 or [], etc.
  class NullPage < BasicPage
    def initialize pager = NullPager.instance, page = 0
      super(pager, page)
    end
  end
end
