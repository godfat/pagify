
module Pagify
  autoload         :ArrayPager, 'pagify/array'
  autoload    :DataMapperPager, 'pagify/dm'
  autoload  :ActiveRecordPager, 'pagify/ar'

  autoload :VERSION, 'pagify/version'
end

require 'pagify/pager'
require 'pagify/page'
require 'pagify/null'
