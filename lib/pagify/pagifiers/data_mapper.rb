
require 'pagify/pagifiers/abstract'

module DataMapper
  module Model
    include Pagify::Pagifier
    def pagify_pager_create model, opts
      Pagify::DataMapperPager.new model, model.query, opts
    end
  end
end
