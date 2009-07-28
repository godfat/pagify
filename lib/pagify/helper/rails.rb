
require 'pagify/helper/html'

module Pagify::Helper::Rails
  def default_attributes
    super.merge(:query_name => :page, :wrapper_class => 'pagination')
  end
end

class Pagify::Helper::HTML
  extend Pagify::Helper::Rails
end

module ApplicationHelper
  def would_paginate objs
    html = objs.pager.html
    name = html.setting[:query_name]
    "<div class=\"#{html.setting[:wrapper_class]}\">" +
    html.links_full(params[name]){ |p| request.path + "?#{name}=#{p}" } +
    '</div>'
  end
end
