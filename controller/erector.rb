require 'erector'

class Hello < Erector::Widget
  def content
    html do 
      head do
        title "The title"
      end
      body do
        p :style => 'color: red;' do 
          text "hello, "
          b @greeted
          text "!"
        end
      end

    end
  end
end
        

class ErectorController < Ramaze::Controller
  

  def index
    Hello.new(:greeted => 'world').to_s
  end

  def gear
  end

end
