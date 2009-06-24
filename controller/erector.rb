require 'erector'

module FlickrReferences
  # def flickpic(...)
end

class Layout < Erector::Widget

  def linky(word, href)
    a "haha", :href => 'http://www.exampler.com'
  end
  
  def content
    html do
      head do
        title "The title"
      end
      body do
        page_body
      end

    end
  end  
end

class Hello < Layout
  def page_body
    p :style => 'color: green;' do
      text "hello, "
      linky @greeted, 5
      text "!"
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
