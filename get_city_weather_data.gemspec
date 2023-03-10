# frozen_string_literal: true

require_relative "lib/get_city_weather_data/version"

Gem::Specification.new do |spec|
  spec.name          = "get_city_weather_data"
  spec.version       = GetCityWeatherData::VERSION
  spec.authors       = ["Denis Paul"]
  spec.email         = ["denis.paul@softvision.com"]

  spec.summary       = "A gem for getting weather data for a city."
  spec.homepage      = "https://github.com/Dev-Denis-Paul/get-city-weather-data-gem"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Dev-Denis-Paul/get-city-weather-data-gem"
  # spec.metadata["changelog_uri"] = "CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html

  spec.add_dependency 'rest-client', '~> 2.1'
  spec.add_dependency 'json', '~> 2.6'
  spec.add_dependency 'dotenv-rails', '2.7.6'
  
  spec.add_development_dependency 'byebug', '11.1.3'
end
