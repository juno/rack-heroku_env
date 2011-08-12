rack-heroku_env
====

A gem that provides exposing Heroku environment variables as HTTP response headers as rack middleware.

![Screenshot](http://farm7.static.flickr.com/6072/6034883614_f94d8d6d61_b.jpg)

`Rack::HerokuEnv` exposes these variables:

* `HTTP_X_HEROKU_DYNOS_IN_USE` as `X-Heroku-Dynos-In-Use`
* `HTTP_X_HEROKU_QUEUE_DEPTH` as `X-Heroku-Queue-Depth`
* `HTTP_X_HEROKU_QUEUE_WAIT_TIME` as `X-Heroku-Queue-Wait-Time`


Usage
----

### Rails 3

    # Gemfile
    gem 'rack-heroku_env', :require => 'rack/heroku_env'

    # config/application.rb
    config.middleware.use Rack::HerokuEnv


### Sinatra

    require 'rack/heroku_env'
    use Rack::HerokuEnv


Installation
----

    $ gem install rack-heroku_env


Testing
----

    $ gem install bundler
    $ bundle install
    $ bundle exec rspec spec/rack-heroku_env_spec.rb
