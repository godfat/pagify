
require 'pagify/helper/abstract'

require 'pagify/helper/detail/setting'
require 'pagify/helper/detail/setup'

module Pagify
  module Helper
    class HTML < Abstract
      def self.default_attributes
        super.merge(
        {  :first_text => '&laquo; First',
            :last_text =>          'Last &raquo;',
            :prev_text => '&lt; Previous',
            :next_text =>          'Next &gt;',
          :inner_links => 4,
          :outer_links => 2,
        #        :step => 3,
          :separator   => ' ',
          :ellipsis    => '...' })
      end

      def links_full page, &block
        page = normalize_page(page)
        "#{links_navigate(page, &block)}<br />#{links(page, &block)}"
      end

      def links_navigate page
        page = normalize_page(page)
        size = pager.size
        attrs = extract_html_attributes

        prev = if page > 1 && page_exists?(page - 1, size)
                 "<a href=\"#{yield(page - 1)}\"#{attrs}>#{setting[:prev_text]}</a>"
               else
                 nil
               end

        post = if page < size && page_exists?(page + 1, size)
                 "<a href=\"#{yield(page + 1)}\"#{attrs}>#{setting[:next_text]}</a>"
               else
                 nil
               end

        [prev, post].compact.join(setting[:separator])
      end

      def links page
        page = normalize_page(page)
        size = pager.size
        attrs = extract_html_attributes

        prepare_links(page).map{ |i|
          if i == page
            case page
              when 1;    setting[:first_text]
              when size; setting[ :last_text]
              else;      page
            end
          else
            case i
              when 1;      "<a href=\"#{yield(i)}\"#{attrs}>#{setting[:first_text]}</a>"
              when size;   "<a href=\"#{yield(i)}\"#{attrs}>#{setting[ :last_text]}</a>"
              when Fixnum; "<a href=\"#{yield(i)}\"#{attrs}>#{i}</a>"
              else;        i.to_s
            end
          end
        }.join(setting[:separator])
      end

      private
      def extract_html_attributes
        attrs = setting.additional_attributes.
                  map{ |key, value| "#{key}=\"#{value}\"" }.join(' ')

        attrs = ' ' + attrs if attrs != ''
        attrs
      end

      def normalize_page page
        pager.__send__(:normalize_page, page)
      end
    end # of HTML
    setup HTML
  end # of Helper
end # of Pagify
