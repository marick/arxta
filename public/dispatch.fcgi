#!/usr/bin/env ruby

require File.expand_path('path-setting', File.dirname(__FILE__), '..')
require 'ramaze'

# FCGI doesn't like you writing to stdout
Ramaze::Log.loggers = [ Ramaze::Logger::Informer.new( __DIR__("../ramaze.fcgi.log") ) ]
Ramaze::Global.adapter = :fcgi

$0 = __DIR__("../start.rb")
require $0
