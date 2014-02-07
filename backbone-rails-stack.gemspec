# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'backbone_rails_stack/version'

Gem::Specification.new do |s|
  s.name          = "backbone-rails-stack"
  s.version       = RailsyBackbone::VERSION
  s.authors       = ["Alexey Savartsov"]
  s.email         = ["asavartsov@gmail.com"]
  s.description   = %q{Backbone, Marionette and Handlebars for Rails apps}
  s.summary       = %q{Backbone, Marionette and Handlebars for Rails apps}
  s.homepage      = "http://github.com/asavartsov/backbone-rails-stack"
  s.license       = "BSD-3"

  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.files = Dir["lib/**/*"] + Dir["vendor/**/*"] + ["LICENSE", "Rakefile", "README.md", "CHANGELOG.md"]

  s.add_dependency 'railties',          '>= 3.1.0'
  s.add_dependency 'handlebars_assets', '~> 0.15'

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rails'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'sass'
  s.add_development_dependency 'uglifier'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'rails-dummy'
  s.add_development_dependency 'mocha'
end
