
require 'pagify/pagifiers/abstract'

module DataMapper
  module Model
    include Pagify::Pagifier
    def pagify_pager_create model, opts
      Pagify::DataMapperPager.new(model, opts, model.query)
    end
  end
end
