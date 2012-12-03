# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-workxp/version'

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
end
