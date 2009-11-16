
require 'pagify/helper/detail/web'

module Pagify::Helper::Rails
  include Pagify::Helper::Web
  def pagify_links objs, &path
    super(objs, :path => lambda{ block_given? ? path.call : request.path },
                :page => lambda{ |name| params[name] })
  end

  alias_method :would_paginate, :pagify_links
end

module ApplicationHelper
  include Pagify::Helper::Rails
end
