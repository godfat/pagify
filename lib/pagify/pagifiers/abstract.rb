
module Pagify
  module Pagifier
    def pagify opts = {}
      opts = {:per_page => 20, :null_page => false, :page => 1}.merge(opts)
      page = opts.delete(:page)
      pagify_pager_create(self, opts).page(page)
    end
  end
end
