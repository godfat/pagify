
# anything for active_record

require 'pagify'
require 'pagify/pagers/details/page_accept_string_or_blank'

require 'pagify/pagers/active_record'
require 'pagify/pagifiers/active_record'

require 'pagify/array' # this was needed for active_record...

# workaround for active_record...
module Pagify
  class ArrayPager < BasicPager
    include PageAcceptStringOrBlank
  end
end
