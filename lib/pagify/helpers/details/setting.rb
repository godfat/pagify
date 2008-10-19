
module Pagify
  module Helpers
    class Setting
      def initialize helper, parent = {}
        @helper = helper
        @parent = parent
        @attributes = extract_default_attributes helper
      end

      def [] key
        if @attributes[key]
           @attributes[key]
        else
          @parent[key]
        end
      end

      def []= key, value
        @attributes[key] = value
      end

      def restore_default!
        @attributes = extract_default_attributes @helper
      end

      def reject_default
        defaults = extract_default_attributes(@helper).keys
        @attributes.reject{ |key, value| defaults.member?(key) }
      end

      private
      def extract_default_attributes helper
        if helper.respond_to? :default_attributes
          helper.default_attributes
        else
          {}
        end
      rescue NotImplementedError
        {}
      end

    end
  end
end
