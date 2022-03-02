# frozen_string_literal: true

source "https://rubygems.org"

# Specify your gem's dependencies in get_city_weather_data.gemspec
gemspec

gem "rake", "~> 13.0"
gem "rspec", "~> 3.0"
gem 'dotenv-rails', :github => "bkeepers/dotenv"
gem 'json'

group :development do
    gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :test do
  gem "webmock"
  gem 'vcr'    
end