
require 'pagify/helper/html'

module Pagify::Helper::Rails
  def default_attributes
    super.merge(:query_name => :page, :wrapper_class => 'pagination',
                :links_type => :links_full)
  end
end

class Pagify::Helper::HTML
  extend Pagify::Helper::Rails
end

module ApplicationHelper
  def would_paginate objs, &path
    path = lambda{ request.path } unless block_given?
    html = objs.pager.html
    name = html.setting[:query_name]
    type = html.setting[:links_type]
    base = path.call
    "<div class=\"#{html.setting[:wrapper_class]}\">" +
      html.send(type, params[name]){ |p| base + "?#{name}=#{p}" } +
    '</div>'
  end
end
