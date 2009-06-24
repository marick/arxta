require 'erector'

class ErectorController < Ramaze::Controller

  class Index < Erector::Widget

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

    def clearer
      div(:class => 'clearer')
    end


    def content
      instruct
      rawtext doctype
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
        body do
          container do
            page_header do
              page_header_background
              h1 raw("AR&otimes;TA")
              h2 do
                text 'Artisanal Retro-Futurism'; br
                text 'crossed with'; br
                text 'Team-Scale Anarcho-Syndicalism'
              end
            end
            content_container do
              div(:id => 'content') do
                p 'here is some content'
                p 'here is some more content'
                p 'here is even more content'
              end
              clearer
            end
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
            footer do
              p "credits"
            end
          end
        end
      end
    end
  end


  def index
    Index.new(:greeted => 'world').to_pretty
  end

end
