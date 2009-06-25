class ErectorController < Ramaze::Controller

  def index
    require 'view/index-page'
    IndexPage.new.to_pretty
  end

end
