# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'loba_commands/version'

Gem::Specification.new do |spec|
  spec.name          = "loba_commands"
  spec.version       = LobaCommands::VERSION
  spec.platform      = Gem::Platform::RUBY
  spec.authors       = ["Richard Newman"]
  spec.email         = ["richard@newmanworks.com"]

  spec.summary       = %q{Loba commands: command-line tools for Loba.}
  spec.description   = %q{Extends Loba to add command-line tools to help manage Loba statements in Ruby code.}
  spec.homepage      = "https://github.com/rdnewman/loba-commands"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.required_ruby_version = '>= 2.1.0'

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "rspec", "~> 3.5"

  spec.add_dependency "loba", "~> 0.3"
end
