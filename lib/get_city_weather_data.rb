# frozen_string_literal: true

require_relative "get_city_weather_data/version"

module GetCityWeatherData

  # autoload :Client, "get_city_weather_data/client"
  # autoload :Error, "get_city_weather_data/error"

  class << self
    # class ApiError < StandardError; end

    attr_accessor :api_key

    BASE_URL = "http://api.weatherapi.com/v1/current.json"

    def get_weather(city)
        @city = city
        get_weather_data
    end

    def setup
        yield self
    end

    private

    def get_weather_data
        begin
            response = RestClient.get "#{BASE_URL}?q=#{@city}", { content_type: :json, accept: :json, "key": api_key }
            current_weather = JSON.parse(response.body, symbolize_names: true)
            current_weather[:current]
        rescue RestClient::ExceptionWithResponse => exception
            api_error_message = JSON.parse(exception.response, symbolize_names: true)[:error][:message]
            api_error_message
            # raise ApiError, api_error_message
        end
    end
  end

end
