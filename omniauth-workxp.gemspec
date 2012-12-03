# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-workxp/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "omniauth-workxp"
  gem.version       = Omniauth::Workxp::VERSION
  gem.authors       = ["liuqi"]
  gem.email         = ["keyboarder5211@gmail.com"]
  gem.description   = %q{Official OmniAuth strategy for Workxp.}
  gem.summary       = %q{Official OmniAuth strategy for Workxp.}
  gem.homepage      = "https://github.com/liuqi1024/omniauth-workxp"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2', '~> 1.1'
  gem.add_development_dependency 'rspec', '~> 2.7'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'webmock'
end
