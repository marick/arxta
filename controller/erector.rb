class ErectorController < Ramaze::Controller

  def index
    require 'view/index-content'
    IndexPage.new.to_pretty
  end

end
