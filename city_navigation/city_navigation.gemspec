# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'city_navigation/version'

Gem::Specification.new do |spec|
  spec.name          = "city_navigation"
  spec.version       = CityNavigation::VERSION
  spec.authors       = ["clockworkpc"]
  spec.email         = ["clockworkpc@gmail.com"]

  spec.summary       = %q{Day 1 of the Advent of Code challenge}
  spec.description   = %q{Create a city grid and calculate the distance from the starting point using taxi geometry}
  spec.homepage      = "https://github.com/clockworkpc/advent-of-code"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
