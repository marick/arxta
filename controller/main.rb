require 'helper/widgets'

class MainController < Ramaze::Controller

  def self.klassify(symbol)
    name = symbol.to_s
    name = name.capitalize
    name = name.gsub(/_([a-z])/) { $1.capitalize }
    name + 'Page'

  end

  def self.has_page(symbol)
    defn = %Q{
      def #{symbol}
        require "view/#{symbol}-page"
        maker = WithinSiteLinkMaker.new(:current_route => :#{symbol})
        #{klassify(symbol)}.new(:within_site_link_maker => maker).to_pretty
      end
    }
    # puts defn
    class_eval defn
  end

  has_page :index
  has_page :gear
  has_page :explanation
  has_page :video
  has_page :help_wanted

end
