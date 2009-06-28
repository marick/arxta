require 'erector'

module Erector
  class Widget
    def emit_via(target, settings = {})
      settings.each do | key, value |
        instance_variable_set('@' + key.to_s, value)
      end
      write_via(target)
    end
  end
end

class WithinSiteLinkMaker < Erector::Widget
  needs :current_route

  def content
    if @route.to_s == @current_route.to_s
      a @text, :id=>'current', :href => @route
    else
      a @text, :href=>@route
    end
  end
end
