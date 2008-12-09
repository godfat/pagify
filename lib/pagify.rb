
module Pagify
  autoload         :ArrayPager, 'pagify/array'
  autoload    :DataMapperPager, 'pagify/data_mapper'
  autoload  :ActiveRecordPager, 'pagify/active_record'

  autoload :VERSION, 'pagify/version'
end

require 'pagify/basic'
require 'pagify/null'
