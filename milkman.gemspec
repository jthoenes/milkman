# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'milkman/version'

Gem::Specification.new do |gem|
  gem.name          = "milkman"
  gem.version       = Milkman::VERSION
  gem.authors       = ["Kevin Tuhumury"]
  gem.email         = ["kevin.tuhumury@gmail.com"]
  gem.homepage      = "http://github.com/kevintuhumury/milkman"
  gem.summary       = %q{Milkman is a Ruby wrapper for the Remember The Milk (RTM) API.}
  gem.description   = %q{This gem provides a Ruby wrapper around the Remember The Milk (RTM) API for use in your own project.}
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.executables   = ["milkman"]
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency "thor"
  gem.add_runtime_dependency "i18n"
  gem.add_runtime_dependency "httparty"

  gem.add_development_dependency "bundler", "~> 1.3"
  gem.add_development_dependency "rake"

  gem.add_development_dependency "rspec"
  gem.add_development_dependency "simplecov"
  gem.add_development_dependency "capture_stdout"
  gem.add_development_dependency "coveralls"
end
