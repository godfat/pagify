
require 'pagify/helper/html'

module Pagify
  module Helper
    module Web
      def pagify_links objs, opts
        html = objs.pager.html
        name = html.setting[:query_name]
        type = html.setting[:links_type]
        base = opts[:path].call
        "<div class=\"#{html.setting[:wrapper_class]}\">" +
          html.send(type, opts[:page][name]){ |p| base + "?#{name}=#{p}" } +
        '</div>'
      end
    end
  end
end
