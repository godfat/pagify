
require 'pagify/pagifier/abstract'

proxy = if defined?(ActiveRecord::Associations::CollectionProxy)
          ActiveRecord::Associations::CollectionProxy
        else
          ActiveRecord::Associations::AssociationCollection
        end

[ActiveRecord::Base, proxy].each{ |klass|
  klass.module_eval do
    extend Pagify::Pagifier
    def self.pagify_pager_create model, opts
      Pagify::ActiveRecordPager.new model, opts
    end
  end
}
