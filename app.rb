# This file contains your application, it requires dependencies and necessary
# parts of the application.
#
# It will be required from either `config.ru` or `start.rb`

require 'ramaze'
    
# Initialize controllers and models
require 'model/init'
require 'controller/init'
