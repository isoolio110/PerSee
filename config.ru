require 'bundler'
Bundler.require 

require './models/food'
require './models/party'
require './models/order'

require 'csv'

require './controllers/application_controller'
require './controllers/foods_controller'

map('/foods'){ run FoodsController }
map('/'){ run ApplicationController }
