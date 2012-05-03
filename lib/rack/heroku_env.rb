module Rack
  class HerokuEnv
    VERSION = "0.0.1"

    def initialize(app)
      @app = app
    end

    def call(env)
      response = @app.call(env)

      heroku_vars(env).each do |variable_name|
        response[1][header_name_for(variable_name)] = env[variable_name]
      end

      response
    end

    private


    def heroku_vars(env)
      env.keys.grep(/\AHTTP_X_HEROKU/)
    end

    def header_name_for(variable_name)
      variable_name.gsub(/\AHTTP_/, '').split('_').map{|w| w.capitalize }.join('-')
    end

  end
end
