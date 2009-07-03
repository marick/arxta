require 'helper/arxta-page'


class IndexPage < ArxtaPage
  def the_footer
    footer do
      p do
        text "The image of futuristic Seattle was composed of photos from "
        a 'Jake Khuon', :href=>"http://www.flickr.com/photos/wintrhawk/470424868/"
        text ", "
        a 'Steve Jurvetson', :href=> "http://www.flickr.com/photos/jurvetson/2904881415/"
        text ', and '
        a 'FaceMePLS', :href=>"http://www.flickr.com/photos/faceme/1509037350/"
        text ". All the images are covered by a Creative Commons license. "
        text "The look and feel of the site is loosely based on the Urban template delivered with "
        a 'RapidWeaver', :href=>"http://www.realmacsoftware.com/rapidweaver/"
        text '.'
      end
    end
  end
  
  def content
    for_page_content do
      p do
        rawtext "We believe "
        a "Agile software development", :href=>"http://www.agilemanifesto.org"
        rawtext " is being dumbed down, commodified,
        and is losing its spirit. We seek to replace the current
        name with one having two virtues: first, that it capture
        more exactly the attitudes originally behind Agile; second,
        that it be obscure enough that no one will assume they
        already know what it means and that&mdash;amazingly
        enough!&mdash;they are already doing it."
      end

      p do
        rawtext 'There are two halves to the story: an attitude toward '
        b 'technology'
        rawtext ' and an attitude toward '
        b 'the social'
        rawtext ". To form the Agile attitude, those two attitudes are crossed
                  (hybridized) like lions or tigers are crossed to form "
        a 'ligers',  :href=>"http://en.wikipedia.org/wiki/Liger"
        rawtext ". Trying to separate the social from the technical is a "
        a 'mistake', :href=>"http://www.exampler.com/blog/2007/11/06/latour-table-of-contents/"
        rawtext '.'
      end

      p do
        within_site_link_maker.emit_via(self, :text => 'Read more...', :route => :explanation)        
      end


    end
  end
end

