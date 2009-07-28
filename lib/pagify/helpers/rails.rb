
require 'pagify/helpers/html'

module Pagify::Helpers::Rails
  def default_attributes
    super.merge(:query_name => :page, :wrapper_class => 'pagination')
  end
end

class Pagify::Helpers::HTML
  extend Pagify::Helpers::Rails
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
