# -*- encoding: utf-8 -*-
require File.expand_path('../lib', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "fluent-plugin-fountain"
  gem.version       = "0.0.1"
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = "https://github.com/mazgi/fluent-plugin-fountain"
  gem.authors       = ["MATSUKI.Hidenori"]
  gem.email         = ["MATSUKI.Hidenori@gmail.com"]

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rake"
  gem.add_development_dependency "fluentd"
  gem.add_runtime_dependency "fluentd"
end
