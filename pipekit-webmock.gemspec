# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pipekit/webmock/version'

Gem::Specification.new do |spec|
  spec.name          = "pipekit-webmock"
  spec.version       = Pipekit::WebMock::VERSION
  spec.authors       = ["jafrog", "makersacademy"]
  spec.email         = ["dev@makersacademy.com"]

  spec.summary       = %q{WebMock extension for requests to Pipedrive}
  spec.description   = %q{Registers a `stub_pipedrive_request` method and makes unregistered request error messages more readable}
  spec.homepage      = "https://github.com/makersacademy/pipekit-webmock"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "webmock", "~>2.1"
  spec.add_dependency "pipekit", "~>2.1.1"
  spec.add_dependency "rack"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
end
