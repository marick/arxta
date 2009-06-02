require 'helper/layout_decisions'

class MainController < Controller
  helper :layout_decisions

  before_all { 
    choose_credits
    identify_current_page
  }

end
