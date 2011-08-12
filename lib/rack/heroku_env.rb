module Rack
  class HerokuEnv
    VERSION = "0.0.1"

    VARIABLE_NAMES = {
      'HTTP_X_HEROKU_DYNOS_IN_USE' => 'X-Heroku-Dynos-In-Use',
      'HTTP_X_HEROKU_QUEUE_DEPTH' => 'X-Heroku-Queue-Depth',
      'HTTP_X_HEROKU_QUEUE_WAIT_TIME' => 'X-Heroku-Queue-Wait-Time',
    }

    def initialize(app)
      @app = app
    end

    def call(env)
      response = @app.call(env)

      VARIABLE_NAMES.each do |variable_name, header_name|
        response[1][header_name] = env[variable_name] if env[variable_name]
      end

      response
    end

  end
end
