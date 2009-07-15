require 'erector'
require 'helper/more-html'




class ArxtaPage < Erector::Widget
  needs :within_site_link_maker

  def initialize(*args)
    super
    @links_relevant_to_this_page = []
  end

  def has_relevant_link(name, hash={})
    @links_relevant_to_this_page << [name, hash]
  end

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
      text "You're expected to override content"
    end
  end

  def for_page_content(&block)
    instruct
    rawtext doctype
    html :xmlns => 'http://www/w3.org/1999/xhtml' do
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
        always_visible_links
        links_relevant_to_this_page()
      end
    end
    clearer
  end


  def the_footer
  end

  def html_head
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

  def always_visible_links
    ul do
      li { within_site_link_maker.emit_via(self, :text => 'Home', :route => :index) }
      li { within_site_link_maker.emit_via(self, :text => 'Words', :route => :explanation) }
      li { within_site_link_maker.emit_via(self, :text => 'Video', :route => :video) }
      li { within_site_link_maker.emit_via(self, :text => 'Gear', :route => :gear) }
      li { within_site_link_maker.emit_via(self, :text => 'Help Wanted', :route => :help_wanted) }
    end
  end

  def links_relevant_to_this_page()
    return if @links_relevant_to_this_page.empty?
    div(:id => 'links_relevant_to_this_page') do
      ul do
        br; br
        @links_relevant_to_this_page.each do |data|
          name = data[0]
          hash = data[1]
          li { a raw(name), hash }
        end
      end
    end

  end


  def clearer
    div(:class => 'clearer')
  end


end
