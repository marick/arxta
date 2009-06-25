class MainController < Ramaze::Controller
  def index
    require 'view/index-page'
    IndexPage.new.to_pretty
  end

  def gear
    require 'view/gear-page'
    GearPage.new.to_pretty
  end
end
