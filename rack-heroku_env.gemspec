# -*- encoding: utf-8 -*-
lib = File.expand_path("../lib/rack/heroku_env.rb", __FILE__)
version = File.read(lib)[/^\s*VERSION\s*=\s*(['"])(\d\.\d\.\d+)\1/, 2] #'# defeat messing with highlighting...

Gem::Specification.new do |s|
  s.name        = "rack-heroku_env"
  s.version     = version
  s.authors     = ["Junya Ogura"]
  s.email       = ["junyaogura@gmail.com"]
  s.homepage    = "https://github.com/juno/rack-heroku_env"
  s.summary     = %q{rack middleware for exposing Heroku environment variables}
  s.description = %q{rack middleware for exposing Heroku environment variables}

  s.rubyforge_project = "rack-heroku_env"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'rack', '~> 1.1'

  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'rspec', '~> 2.13.0'
end
