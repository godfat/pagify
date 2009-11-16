
require 'pagify/helper/html'

module Pagify::Helper::Rails
  def pagify_links objs, &path
    path = lambda{ request.path } unless block_given?
    html = objs.pager.html
    name = html.setting[:query_name]
    type = html.setting[:links_type]
    base = path.call
    "<div class=\"#{html.setting[:wrapper_class]}\">" +
      html.send(type, params[name]){ |p| base + "?#{name}=#{p}" } +
    '</div>'
  end

  alias_method :would_paginate, :pagify_links
end

module ApplicationHelper
  include Pagify::Helper::Rails
end
