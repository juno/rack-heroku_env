require 'bundler'

Bundler.setup(:runtime, :test)
Bundler.require(:test)
$:.push File.join(File.dirname(__FILE__), '..', 'lib')

require 'rack/heroku_env'
require 'rack/mock'
