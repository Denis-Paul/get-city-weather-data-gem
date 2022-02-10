require "rest-client"
require 'json'

module GetCityWeatherData
    class Client
        BASE_URL = "http://api.weatherapi.com/v1/current.json"

        attr_reader :city, :api_key

        def initialize(city:, api_key:)
            @city = city
            @api_key = api_key
        end
    
        def get_weather
            get_weather_data
        end

        private

        def get_weather_data
            begin
                response = RestClient.get "#{BASE_URL}?q=#{@city}", { content_type: :json, accept: :json, "key": @api_key }
                current_weather = JSON.parse(response.body, symbolize_names: true)
                current_weather[:current]
            rescue RestClient::ExceptionWithResponse => exception
                api_error_message = JSON.parse(exception.response, symbolize_names: true)[:error][:message]
                api_error_message
            end
        end

        # def inspect
        #     "#<GetCityWeatherData::Client>"
        # end
    end
end