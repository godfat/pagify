
module Pagify
  autoload         :ArrayPager, 'pagify/array'
  autoload    :DataMapperPager, 'pagify/data_mapper'
  autoload  :ActiveRecordPager, 'pagify/active_record'
end

require 'pagify/basic'
require 'pagify/null'
