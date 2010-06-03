require 'rubygems'
require 'sinatra/base'
require 'pp'
require 'helper/widgets'

require 'erector'
include Erector::Mixin

class Controller < Sinatra::Base  

  set :static, true
  set :root, File.join(File.dirname(__FILE__), "..")

  def klassify(prefix)
    prefix = prefix.capitalize
    prefix = prefix.gsub(/_([a-z])/) { $1.capitalize }
    View.const_get(prefix + 'Page')
  end

  def show_page(route)
    prefix = route=="/" ? 'index' : File.split(route).last
    require "view/#{prefix}-page"
    maker = WithinSiteLinkMaker.new(:current_route => route)
    klassify(prefix).new(:within_site_link_maker => maker).to_pretty
  end

  def self.has_page(route)
    get(route) do 
      show_page(request.path)
    end
  end

  has_page '/'
  has_page '/gear'
  has_page '/explanation'
  has_page '/help_wanted'
  has_page '/video'
end

