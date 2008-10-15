
require 'pagify/helpers/abstract'

require 'pagify/helpers/details/setting'
require 'pagify/helpers/details/setup'

module Pagify
  module Helpers
    class HTML < Abstract
      def self.default_attributes
        {  :first_text => '&laquo; First',
            :last_text =>          'Last &raquo;',
            :prev_text => '&lt; Previous',
            :next_text =>          'Next &gt;',
          :inner_links => 4,
          :outer_links => 1,
          :separator   => ' ' }
      end
    end
    setup HTML
  end
end
