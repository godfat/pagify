
module Pagify
  module Pagifier

    attr_reader :pagify_pager

    def pagify opts = {}
      opts = {:per_page => 20, :null_page => false, :page => 1}.merge(opts)
      page = opts.delete(:page)

      (if pagify_pager && opts == pagify_pager.opts
        pagify_pager
      else
        @pagify_pager = pagify_pager_create(self, opts)

      end).page(page)
    end

  end
end
