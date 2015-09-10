# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dotenv/beefy/version'

Gem::Specification.new do |spec|
  spec.name          = "dotenv-beefy"
  spec.version       = Dotenv::Beefy::VERSION
  spec.authors       = ["BetterUp Developers"]
  spec.email         = ["developers@betterup.co"]

  spec.summary       = %q{Load all the application environments }
  spec.description   = %q{Load all relevant .env files to boot usable application environment}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'dotenv'

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
