
module Pagify
  module Helpers
    class Abstract
      class << self
        def default_attributes
          raise NotImplementedError
        end

        def setting
          @setting ||= Setting.new(self)
        end
      end

      def setting
        @setting ||= Setting.new(self, self.class.setting)
      end

      def generate
        raise NotImplementedError
      end

    end
  end
end
