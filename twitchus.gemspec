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

  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "cucumber"
  gem.add_development_dependency "aruba"
end
