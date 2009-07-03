require 'helper/arxta-page'


class VideoPage < ArxtaPage


  def confreaks_url(subdir, differentiator)
    "http://agileroots2009.confreaks.com/#{subdir}16-jun-2009-09-00-artisanal-retro-futurism-team-scale-anarcho-syndicalism-brian-marick#{differentiator}"
  end

  def video(size)
    confreaks_url("videos/", "-#{size}.mp4")
  end

  def confreaks_home
    confreaks_url('', '.html')
  end

  def content
    for_page_content do
      p do
        rawtext "Brian Marick gave a talk about AR&otimes;TA at "
        a "Agile Roots", :href=>"http://agileroots.com"
        raw text "."
      end

      div :style => 'text-align: center;' do
      a :href => video('small') do
        img(:src => "/images/agile-roots-talk.png")
      end


      p do
        a "Normal definition (640 x 360 MP4)", :href => video('small'); br
        a "High definition (1280 x 720 HD MP4)", :href => video('large'); br
        a "Video home page at Confreaks", :href => confreaks_home
      end

      end

      p do
        rawtext %q{"I found @marick's keynote at #agileroots the best talk I've heard in 10 years.
                 totally personal of course. Lots of new news to me" &nbsp&mdash;&nbsp;}
        a "Alistair Cockburn", :href => "http://twitter.com/TotherAlistair/status/2201760379"
      end

      p do
        rawtext %q{"#agileroots ARxTA talk from @marick was FANTASTIC.
                   Reflected my observations & wishes perfectly." &nbsp;&mdash;&nbsp;}
        a "James Shore", :href=> "http://twitter.com/jamesshore/status/2194239944"
      end
    end
  end
end
