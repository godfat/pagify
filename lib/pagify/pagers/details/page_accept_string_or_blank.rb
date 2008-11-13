
module Pagify
  module PageAcceptStringOrBlank
    def page n
      if n.blank?
        n = 1
      else
        n = n.to_i
      end
      super(n)
    end
  end

end
