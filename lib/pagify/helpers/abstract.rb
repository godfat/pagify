
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
        size = pager.size

        inner_prev, inner_post = links_for_prev_and_post(setting[:inner_links], page, size)
        outer_prev, outer_post = [ (1..setting[:outer_links]).to_a,
                                   ((size - setting[:outer_links] + 1)..size).to_a ]

        links_prev = outer_prev + ['...'] + inner_prev
        links_post = inner_post + ['...'] + outer_post

        # remove '...' if there's overlap
        links_prev.delete('...') if links_prev.uniq!
        links_post.delete('...') if links_post.uniq!

        links_prev + [page] + links_post
      end

      private
      def extract_html_attributes
        self.class.default_attributes.keys
      end
      def links_for_prev_and_post limit, page, size
        [ (1..limit).map{ |i| page_exists?(page - i, size) }.reverse.compact,
          (1..limit).map{ |i| page_exists?(page + i, size) }.compact          ]
      end
      def page_exists? page, size
        if page >= 1 && page <= size
          page
        else
          nil
        end
      end
    end
  end
end
