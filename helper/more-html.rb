require 'erector'

module Erector

  class Widget

  def self.combine(result, tag1, tag2)
    defn = "def #{result}(*args, &block)
              #{tag1} { #{tag2}(*args, &block) }
            end"
    module_eval defn
  end

  combine :lip, :li, :p
  combine :pem, :p, :em
  combine :pb, :p, :b

end

  end
