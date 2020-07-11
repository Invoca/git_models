# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'git_models/version'

Gem::Specification.new do |spec|
  spec.name          = 'git_models'
  spec.version       = GitModels::VERSION
  spec.authors       = ['Invoca Development']
  spec.email         = ['development@invoca.com']
  spec.summary       = "Rails models for Git data."
  spec.homepage      = "https://github.com/Invoca/git_models"

  spec.metadata = {
    'allowed_push_host' => "https://rubygems.org"
  }

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['app', 'lib']

  spec.add_dependency 'rails',        '>= 4.2'
  spec.add_dependency 'hobo_fields',  '~> 3.0'
  spec.add_dependency 'git_lib',      '~> 1.2'
end
