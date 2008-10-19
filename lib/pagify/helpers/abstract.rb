
module Pagify
  module Helpers
    class Abstract
      def self.default_attributes
        raise NotImplementedError
      end

      def self.setting
        @setting ||= Setting.new(self)
      end

      attr_reader :pager
      def initialize pager
        @pager = pager
      end

      def setting
        @setting ||= Setting.new(self, self.class.setting)
      end

      def links page
        raise NotImplementedError
      end

    end
  end
end
