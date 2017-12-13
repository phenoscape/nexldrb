# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nexldrb/version'

Gem::Specification.new do |s|
  s.name        = 'nexldrb'
  s.version     = Nexld::VERSION
  s.platform    = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.0'
  s.date        = '2017-12-13'
  s.summary     = "NeXML - JSON-LD Converter"
  s.description = "NeXML - JSON-LD Converter"
  s.authors     = "Scott Chamberlain"
  s.email       = 'myrmecocystus@gmail.com'
  s.homepage    = 'https://github.com/phenoscape/nexldrb'
  s.licenses    = 'MIT'

  s.files = `git ls-files -z`.split("\x0").reject {|f| f.match(%r{^(test|spec|features)/}) }
  s.require_paths = ["lib"]

  s.add_development_dependency 'bundler', '~> 1.14', '>= 1.14.6'
  s.add_development_dependency 'rake', '~> 12.0', '>= 12.0.0'
  s.add_development_dependency 'test-unit', '~> 3.2', '>= 3.2.1'

  s.add_runtime_dependency 'multi_json', '~> 1.12', '>= 1.12.1'
  s.add_runtime_dependency 'nokogiri', '~> 1.8', '>= 1.8.1'
  s.add_runtime_dependency 'json-ld', '~> 2.1', '>= 2.1.7'
end
