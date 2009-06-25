require 'erector'


class ArxtaPage < Erector::Widget

  def doctype
    %q{
        <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
      }
  end


  def self.makediv(name, id_name = name)
    method = "def #{name}(&block)
                div(:id => '#{id_name}', &block)
              end"
    puts method
    class_eval(method)
  end


  makediv :container
  makediv :page_header, 'pageHeader'
  makediv :page_header_background, 'pageHeaderBackground'
  makediv :content_container, 'contentContainer'
  makediv :sidebar_container, 'sidebarContainer'
  makediv :nav_container, 'navcontainer'
  makediv :sidebar
  makediv :sidebar_header, 'sideHeader'
  makediv :footer

  def for_page_content(&block)
    instruct
    rawtext doctype
    html_head
    body do
      container do
        the_header
        content_container do
          div(:id => 'content') do
            block.call
          end
          clearer
        end
        the_sidebar
        the_footer
      end
    end
  end

  def the_header
    page_header do
      page_header_background
      h1 raw("AR&otimes;TA")
      h2 do
        text 'Artisanal Retro-Futurism'; br
        text 'crossed with'; br
        text 'Team-Scale Anarcho-Syndicalism'
      end
    end
  end

  def the_sidebar
    sidebar_container do
      nav_container do
        ul do
          li { a 'Home', :href => 'index', :id=>'current', :rel=>'self' }
          li { a 'Gear', :href => 'gear', :rel=>'self'}
        end
      end
      sidebar do
        h1 :class => 'sideHeader' do
        end
      end
    end
    clearer
  end

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

  def html_head
    html :xmlns => 'http://www/w3.org/1999/xhtml' do
      head do
        meta 'http-equiv' => 'content-type', 'content' => 'text/html; charset=utf-8'
        meta 'http-equiv'=> "Content-Script-Type", 'content'=>"text/javascript"
        meta 'http-equiv'=> "Content-Style-Type", 'content'=>"text/css"
        meta 'name'=> "robots", 'content'=>"all"
        meta 'name'=> "description", 'content'=>"Artisanal retro-futurism crossed with team-scale anarcho-syndicalism"
        meta 'name'=> "generator", 'content'=>"Ramaze #{Ramaze::VERSION}"
        meta 'name'=> "keywords", 'content'=>"software artisan, software craftsmanship, agile, retro-futurism, software teams, anarcho syndicalism, agile manifesto"
        meta 'name'=> "author", 'content'=>"Brian Marick"
        meta 'name'=> "date", 'content' => "#{Time.now.iso8601}"

        title raw("AR&otimes;TA")

        link :href=>"/css/screen.css", :media=>"screen", :rel=>"stylesheet",
             :type=>"text/css"
      end
    end
  end


  def clearer
    div(:class => 'clearer')
  end


end