# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'boson_nlp/version'

Gem::Specification.new do |spec|
  spec.name          = 'boson_nlp'
  spec.version       = BosonNlp::VERSION
  spec.authors       = ['tshunglee']
  spec.email         = ['tshunglee.tan@hotmail.com']

  spec.summary       = %q{A simple wrapper of BosonNlp rest api }
  spec.description   = %q{Write a longer description or delete this line.}
  spec.homepage      = 'https://github.com/Tan-Tshunglee/boson_nlp'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '~> 2.1'

  spec.add_dependency 'httparty', '~> 0.13.5'


  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
