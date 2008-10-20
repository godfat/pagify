
module Pagify
  module Pagifier

    attr_reader :pagify_pager

    # turn on cache if single threaded
    def pagify_cache
      @pagify_cache ||= false
    end

    # cleanup cache if turn off cache
    def pagify_cache= bool
      @pagify_pager = nil unless bool
      @pagify_cache = bool
    end

    def pagify opts = {}
      opts = {:per_page => 20, :null_page => false, :page => 1}.merge(opts)
      page = opts.delete(:page)

      pager = if pagify_cache
                @pagify_pager ||= pagify_pager_create(self, opts)
                pagify_pager.opts = opts
                pagify_pager
              else
                pagify_pager_create(self, opts)
              end

      pager.page(page)
    end

  end
end
