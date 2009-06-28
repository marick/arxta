require 'helper/widgets'

class MainController < Ramaze::Controller
  def self.has_page(name)
    name = name.to_s
    page_klass = name.capitalize + 'Page'

    defn = %Q{
      def #{name}
        require "view/#{name}-page"
        maker = WithinSiteLinkMaker.new(:current_route => :#{name})
        #{page_klass}.new(:within_site_link_maker => maker).to_pretty
      end
    }
    puts defn
    class_eval defn
  end

  has_page :index
  has_page :gear

end
