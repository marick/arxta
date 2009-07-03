require 'helper/arxta-page'


class GearPage < ArxtaPage

  def sticker(description, image_file)
    p do
      b description
      img :src => "/images/#{image_file}"
    end
  end

  def content
    for_page_content do
      p do
        rawtext "The following stickers are the
            size of the iconic 3x5 card. They
            are available "
        a 'for the asking', :href=>"mailto:marick@exampler.com"
        rawtext " so long as you
            promise to put it somewhere people
            will see it and ask you about
            it. Please say which one you want."
      end


      sticker 'The Anonymous', 'sticker.jpg'
      sticker 'The Bordered', 'arxta-with-url.png'
      sticker 'The Name Dropper', 'agree.png'
    end
  end
end
