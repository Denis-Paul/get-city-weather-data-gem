require "rest-client"
require 'json'
require 'dotenv'
Dotenv.load
# Dotenv.load(File.expand_path("../.env", __FILE__))

# module GetCityWeatherData
#     class << self
#         BASE_URL = "http://api.weatherapi.com/v1/current.json"

#         attr_reader :city #, :api_key
#         attr_accessor :api_key
    
#         def get_weather(city)
#             @city = city
#             @api_key = api_key
#             get_weather_data
#         end

#         def config
#             yield self
#         end

#         private

#         def get_weather_data
#             begin
#                 response = RestClient.get "#{BASE_URL}?q=#{@city}", { content_type: :json, accept: :json, "key": @api_key }
#                 current_weather = JSON.parse(response.body, symbolize_names: true)
#                 current_weather[:current]
#             rescue RestClient::ExceptionWithResponse => exception
#                 api_error_message = JSON.parse(exception.response, symbolize_names: true)[:error][:message]
#                 api_error_message
#             end
#         end

#         # def inspect
#         #     "#<GetCityWeatherData::Client>"
#         # end
#     end
# end