require 'helper/layout_decisions'

class MainController < Controller
  helper :layout_decisions

  before_all { 
    choose_credits
    remember_action
  }

  def index
    puts "==== In controller action index"
    puts "==== current action: #{Ramaze::Current.action.name}"
  end

  def gear
    puts "==== In controller action gear"
    puts "==== current action: #{Ramaze::Current.action.name}"
  end

end
