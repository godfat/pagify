
require 'pagify/helper/detail/web'

module Pagify::Helper::Innate
  include Pagify::Helper::Web
  def pagify_links objs, &path
    super(objs, :path => lambda{ block_given? ? path.call : request.path  },
                :page => lambda{ |name| request[name] })
  end
end

module Innate
  module Helper
    Pagify = Pagify::Helper::Innate
  end
end
