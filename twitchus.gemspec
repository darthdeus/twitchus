# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'twitchus/version'

Gem::Specification.new do |gem|
  gem.name          = "twitchus"
  gem.version       = Twitchus::VERSION
  gem.authors       = ["Jakub Arnold"]
  gem.email         = ["darthdeus@gmail.com"]
  gem.description   = %q{Twitchus is a gem for managing a list of Twitch.tv streams}
  gem.summary       = %q{Twitchus is a gem for managing a list of Twitch.tv streams}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "rest-client", "~> 1.6.7"
  gem.add_dependency "redis",       "~> 3.0.1"

  gem.add_development_dependency "mock_redis", "~> 0.6.1"
  gem.add_development_dependency "webmock",    "~> 1.8.10"
  gem.add_development_dependency "pry",        "~> 0.9.10"
  gem.add_development_dependency "rake",       "~> 0.9.2.2"
  gem.add_development_dependency "rspec",      "~> 2.11.0"
  gem.add_development_dependency "cucumber",   "~> 1.2.1"
  gem.add_development_dependency "aruba",      "~> 0.4.11"
end
