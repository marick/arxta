require 'erector'
require 'helper/more-html'




class ArxtaPage < Erector::Widget
  needs :within_site_link_maker

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

  def content
    for_page_content do
      puts "for_page_content"
      text "You're expected to override content"
    end
  end

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
#    puts "making sidebar: #{within_site_link_maker.inspect}"
    sidebar_container do
      nav_container do
        ul do
          li { within_site_link_maker.emit_via(self, :text => 'Home', :route => :index) }
          li { within_site_link_maker.emit_via(self, :text => 'Words', :route => :explanation) }
          li { within_site_link_maker.emit_via(self, :text => 'Video', :route => :video) }
          li { within_site_link_maker.emit_via(self, :text => 'Gear', :route => :gear) }
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
