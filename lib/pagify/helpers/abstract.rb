
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

      protected
      def prepare_links page
        size = pager.size
        return [] if page < 1 || page > size

        outer_prev, inner_prev, inner_post, outer_post = caculate_links(page, size)

        # concat outer and inner, remove overlap
        links_prev = outer_prev + [setting[:ellipsis]] + inner_prev
        links_post = inner_post + [setting[:ellipsis]] + outer_post

        # clean up overlap and remove '...' if there's overlap or no pages there
        links_prev.delete(setting[:ellipsis]) if links_prev.uniq! || links_prev.size == 1
        links_post.delete(setting[:ellipsis]) if links_post.uniq! || links_post.size == 1

        current = links_prev.empty? && links_post.empty? ? [] : [page]

        links_prev + current + links_post
      end

      private
      def caculate_links page, size
        inner_prev, inner_post = caculate_inner(setting[:inner_links], page, size)
        outer_prev, outer_post = caculate_outer(setting[:outer_links], page, size,
                                                inner_prev, inner_post)

        [outer_prev, inner_prev, inner_post, outer_post]
      end
      def caculate_inner limit, page, size
        [ (1..limit).map{ |i| page_exists?(page - i, size) }.reverse.compact,
          (1..limit).map{ |i| page_exists?(page + i, size) }.compact          ]
      end
      def caculate_outer limit, page, size, inner_prev, inner_post
        # caculate index
        prev_last  = [limit,            (inner_prev.first || 1)   ].min
        post_first = [size - limit + 1, (inner_post.last  || size)].max

        # create outer
        outer_prev, outer_post = [ (          1 .. prev_last ).to_a,
                                   ( post_first .. size      ).to_a  ]

        # remove current page
        outer_prev.delete(page)
        outer_post.delete(page)

        [outer_prev, outer_post]
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
