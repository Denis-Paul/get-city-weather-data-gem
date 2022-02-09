# frozen_string_literal: true

require_relative "get_city_weather_data/version"

module GetCityWeatherData
  autoload :Client, "get_city_weather_data/client"
  autoload :Error, "get_city_weather_data/error"
end
