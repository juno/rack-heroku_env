require 'simplecov'
require 'coveralls'

SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.start do
  add_filter '.bundle/'
  add_filter 'spec/'
end

require 'bundler'

Bundler.setup(:runtime, :test)
Bundler.require(:test)
$:.push File.join(File.dirname(__FILE__), '..', 'lib')

require 'rack/heroku_env'
require 'rack/mock'
