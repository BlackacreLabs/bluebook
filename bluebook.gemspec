# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bluebook/version'

Gem::Specification.new do |gem|
  gem.name          = 'bluebook'
  gem.version       = Bluebook::VERSION
  gem.authors       = ['Kyle Mitchell']
  gem.email         = ['kyle@blackacrelabs.org']
  gem.description   = <<-eof
    Bluebook provides utility functions for producing valid legal
    citations per The Bluebook: A Uniform System of Citation R. 1.4(e),
    at 58 (Columbia Law Review Ass'n et al. eds., 19th ed. 2010), the
    predominant citation manual in United States legal practice.
  eof
  gem.summary       = %q{Bluebook legal citation}
  gem.homepage      = 'https://github.com/BlackacreLabs/bluebook'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.required_ruby_version = '>= 1.9.3'

  gem.add_dependency 'thor', '~>0.16'

  gem.add_development_dependency 'rspec', '~> 2.0'
  gem.add_development_dependency 'guard-rspec'
  gem.add_development_dependency 'guard-bundler'
end
