# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = 'invariant'
  gem.version       = '0.0.1'
  gem.authors       = ["Norbert Wojtowicz"]
  gem.email         = ["wojtowicz.norbert@gmail.com"]
  gem.description   = 'Document your code invariants'
  gem.summary       = gem.description
  gem.homepage      = "https://github.com/pithyless/invariant"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency('rspec', "~> 2.12.0")
end
