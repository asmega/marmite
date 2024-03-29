# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'marmite/version'

Gem::Specification.new do |spec|
  spec.name          = "marmite"
  spec.version       = Marmite::VERSION
  spec.authors       = ["Phil Lee"]
  spec.email         = ["asmega@ph-lee.com"]
  spec.description   = "A command line tool to find out a GitHub user's favourite language"
  spec.summary       = "A command line tool to find out a GitHub user's favourite language"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"

  spec.add_dependency "octokit", "~> 2.0"
  spec.add_dependency "highline"
end
