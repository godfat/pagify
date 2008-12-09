
# anything for data_mapper

gem 'extlib', '<=0.9.8'
gem 'dm-core', '<=0.9.7'
gem 'dm-aggregates', '<=0.9.7'

require 'dm-core'
require 'dm-aggregates'

require 'pagify'
require 'pagify/pagers/details/page_accept_string_or_blank'

require 'pagify/pagers/data_mapper'
require 'pagify/pagifiers/data_mapper'

