
module Pagify
  module PageAcceptStringOrBlank
    private
    def normalize_page n
      if n.blank?
        n = 1
      else
        n = n.to_i
      end
    end
  end

end
