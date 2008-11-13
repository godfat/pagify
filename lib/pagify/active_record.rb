
# anything for active_record

require 'active_record'

require 'pagify'
require 'pagify/pagers/active_record'
require 'pagify/pagifiers/active_record'

require 'pagify/array' # this was needed for active_record...

# workaround for active_record...
module Pagify
  class ArrayPager < BasicPager
    # it simply call super(page.to_i), so ActiveRecordPaginator also eat string.
    def page page; super page.to_i; end
  end
end
