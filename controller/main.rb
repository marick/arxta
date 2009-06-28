require 'helper/widgets'

class MainController < Ramaze::Controller
  def index
    require 'view/index-page'
    maker = WithinSiteLinkMaker.new(:current_route => :index)
    IndexPage.new(:within_site_link_maker => maker).to_pretty
  end

  def gear
    require 'view/gear-page'
    maker = WithinSiteLinkMaker.new(:current_route => :gear)
    GearPage.new(:within_site_link_maker => maker).to_pretty
  end
end
