
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "morbotron/version"

Gem::Specification.new do |spec|
  spec.name          = "morbotron"
  spec.version       = Morbotron::VERSION
  spec.authors       = ["César Camacho"]
  spec.email         = ["chanko@gmail.com"]

  spec.summary       = %q{Gem to wrap Morbotron.com API}
  spec.description   = %q{Gem to wrap Morbotron.com API}
  spec.homepage      = 'https://github.com/chanko/morbotron'
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'minitest'#, '~> 5.8.4'
  spec.add_development_dependency 'pry-byebug'#, '~> 1.3.3'
  spec.add_development_dependency 'vcr'#, '~> 3.0.1'
  spec.add_development_dependency 'webmock'#, '~> 1.22.6'

  spec.add_dependency 'faraday'#, '~> 0.9.2'
  spec.add_dependency 'json'#, '~> 1.8.3'
  spec.add_dependency 'word_wrap'#, '~> 1.0.0'
end
