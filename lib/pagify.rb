
module Pagify
  autoload         :ArrayPager, 'pagify/array'
  autoload    :DataMapperPager, 'pagify/data_mapper'
  autoload  :ActiveRecordPager, 'pagify/active_record'
end

require 'pagify/pager/basic'
require 'pagify/page/basic'

require 'singleton'

require 'pagify/pager/null'
require 'pagify/page/null'
