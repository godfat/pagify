
require 'pagify/pagifier/abstract'

[ActiveRecord::Base, ActiveRecord::Associations::AssociationCollection].each{ |klass|
  klass.module_eval do
    extend Pagify::Pagifier
    def self.pagify_pager_create model, opts
      Pagify::ActiveRecordPager.new model, opts
    end
  end
}
