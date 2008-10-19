
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
          :outer_links => 2,
        #        :step => 3,
          :separator   => ' ' }
      end

      def links page
        size = pager.size
        attrs = setting.reject_default.map{ |key, value| "#{key}=\"#{value}\"" }.join(' ')
        attrs = ' ' + attrs if attrs != ''
        super(page).map{ |i|
          case i
            when 1;      "<a href=\"#{yield(i)}\"#{attrs}>#{setting[:first_text]}</a>"
            when size;   "<a href=\"#{yield(i)}\"#{attrs}>#{setting[ :last_text]}</a>"
            when Fixnum; i == page ? i : "<a href=\"#{yield(i)}\"#{attrs}>#{i}</a>"
            else;        i.to_s
          end
        }.join(' ')
      end

    end
    setup HTML
  end
end
