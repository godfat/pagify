
module Pagify
  autoload         :ArrayPager, 'pagify/adapters/array'
  autoload    :DataMapperPager, 'pagify/adapters/data_mapper'
  autoload  :ActiveRecordPager, 'pagify/adapters/active_record'

  autoload :VERSION, 'pagify/version'
end

require 'pagify/pager'
require 'pagify/page'
require 'pagify/null'
