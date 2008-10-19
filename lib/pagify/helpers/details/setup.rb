
module Pagify
  module Helpers
    def self.setup helper_class
      Pagify::BasicPager.module_eval do
        helper_name = helper_class.to_s.downcase[/::?(\w+)$/, 1]
        define_method helper_name do
          variable_name = "@helper_#{helper_name}"
          instance_variable_get(variable_name) or
          instance_variable_set(variable_name, helper_class.new(self))
        end
      end

      # hmm.... how should i define this method?
      # Pagify::BasicPage.module_eval do
      #   helper_name = helper_class.to_s.downcase[/::?(\w+)$/, 1]
      #   define_method helper_name do
      #     pager.__send__ helper_name
      #   end
      # end
    end
  end
end
