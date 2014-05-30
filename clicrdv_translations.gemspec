# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'clicrdv_translations/version'

Gem::Specification.new do |spec|
  spec.name          = "clicrdv_translations"
  spec.version       = ClicrdvTranslations::VERSION
  spec.authors       = ["David Ruyer"]
  spec.email         = ["david.ruyer@clicrdv.com"]
  spec.summary       = %q{Helper for fetching the translation hash for non-rails projects}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = Dir['README.md', 'lib/**/*']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "localeapp", "~> 0.7"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
