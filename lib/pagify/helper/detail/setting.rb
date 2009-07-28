
require 'pagify/helper/abstract'

module Pagify
  module Helper
    # TODO: refactor me!!
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

      def to_hash
        @attributes.dup
      end

      def restore_default!
        @attributes = extract_default_attributes @helper
      end

      def additional_attributes
        defaults = extract_default_attributes(
                     @helper.kind_of?(Abstract) ? @helper.class : @helper).keys

        @parent.to_hash.merge(@attributes).reject{ |key, value| defaults.member?(key) }
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

    end # of Setting
  end # of Helper
end # of Pagify
