
module Pagify
  autoload         :ArrayPager, 'pagify/array'
  autoload    :DataMapperPager, 'pagify/data_mapper'
  autoload  :ActiveRecordPager, 'pagify/active_record'
end

require 'pagify/pagers/basic'
require 'pagify/pages/basic'

require 'singleton'

require 'pagify/pagers/null'
require 'pagify/pages/null'
