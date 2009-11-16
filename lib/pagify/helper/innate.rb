
require 'pagify/helper/html'

module Innate
  module Helper
    module Pagify
      def pagify_links objs, &path
        path = lambda{ request.path } unless block_given?
        html = objs.pager.html
        name = html.setting[:query_name]
        type = html.setting[:links_type]
        base = path.call
        "<div class=\"#{html.setting[:wrapper_class]}\">" +
          html.send(type, request[name]){ |p| base + "?#{name}=#{p}" } +
        '</div>'
      end
    end # of Pagify
  end # of Helper
end # of Innate
