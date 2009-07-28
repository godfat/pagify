
# anything for active_record

require 'pagify'
require 'pagify/pager/detail/page_accept_string_or_blank'

require 'pagify/pager/active_record'
require 'pagify/pagifier/active_record'

require 'pagify/array' # this was needed for active_record...

# workaround for active_record...
module Pagify
  class ArrayPager < BasicPager
    include PageAcceptStringOrBlank
  end
end
