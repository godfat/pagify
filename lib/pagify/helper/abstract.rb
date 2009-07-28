
module Pagify
  module Helper
    class Abstract
      def self.default_attributes
        {}
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

        links_prev, links_post = caculate_2_parts(*caculate_4_parts(page, size))

        current = links_prev.empty? && links_post.empty? ? [] : [page]

        links_prev + current + links_post
      end

      private
      def caculate_2_parts outer_prev, inner_prev, inner_post, outer_post
        [ caculate_part(outer_prev, inner_prev),
          caculate_part(inner_post, outer_post)  ]
      end

      # concat outer and inner, remove overlap
      def caculate_part left, right
        # don't use ellipsis if there's no spaces between them
        ellipsis = !left.empty? && (left.last + 1) == right.first ?
          [] : [setting[:ellipsis]]

        part = left + ellipsis + right

        # clean up overlap and remove '...' if
        part.delete(setting[:ellipsis]) if
          part.uniq!     || # there's overlap
          part.size == 1    # no pages there

        part
      end

      def caculate_4_parts page, size
        inner_prev, inner_post = caculate_inner(setting[:inner_links], page, size)
        outer_prev, outer_post = caculate_outer(setting[:outer_links], page, size,
                                                inner_prev, inner_post)

        [outer_prev, inner_prev, inner_post, outer_post]
      end

      def caculate_inner limit, page, size
        prev, post = page - limit, page + limit

        left   = extract_pages(  prev      ... page, size )
        right  = extract_pages( (page + 1) ..  post, size )

        # adding more right pages if left pages were not enough.
        right.push(
          *extract_pages(
            (post + 1) .. (post + limit - left.size),  size )) if left.size < limit

        # ditto
        left.unshift(
          *extract_pages(
            (prev - limit - right.size) .. (prev - 1), size )) if right.size < limit

        [left, right]
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

      def extract_pages range, size
        range.map{ |i| page_exists?(i, size) }.compact
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
