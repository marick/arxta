module Ramaze
  module Helper
    module LayoutDecisions
      def choose_credits
        return if Current.action.name != 'index'
	@credits = %Q{
          <p>
	  The image of futuristic Seattle was composed of photos from <a href="http://www.flickr.com/photos/wintrhawk/470424868/">Jake Khuon</a>, 
	  <a href="http://www.flickr.com/photos/jurvetson/2904881415/">Steve Jurvetson</a>, and <a href="http://www.flickr.com/photos/faceme/1509037350/">"FaceMePLS"</a>. All the images are covered by a Creative Commons license. The look and feel of the site is loosely based on the Urban template delivered with <a href="http://www.realmacsoftware.com/rapidweaver/">RapidWeaver</a>. 
	 </p>
        }
      end

      def identify_current_page
      end
    end
  end
end
