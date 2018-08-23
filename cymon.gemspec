lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "cymon/version"

Gem::Specification.new do |spec|
  spec.name          = "cymon"
  spec.version       = Cymon::VERSION
  spec.authors       = ["Antony Falegkos"]
  spec.email         = ["falegk1@gmail.com"]

  spec.summary       = %q{A Ruby client gem for cymon.io API}
  spec.description   = %q{Cymon is the largest open tracker of malware, phishing, botnets, spam, and more. Brought to you by eSentire.}
  spec.homepage      = "https://github.com/falegk/cymon"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'vcr', '~> 4.0', '>= 4.0.0'

  spec.add_runtime_dependency 'faraday', '~> 0.15', '>= 0.15.2'
  spec.add_runtime_dependency 'faraday_middleware', '~> 0.12', '>= 0.12.2'
end
