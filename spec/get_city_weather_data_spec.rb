# frozen_string_literal: true
require 'dotenv'
require 'webmock/rspec'

RSpec.describe GetCityWeatherData do
  it "has a version number" do
    expect(GetCityWeatherData::VERSION).not_to be nil
  end

  describe 'API call' do
    # let(:city_weather_data_response) { GetCityWeatherData.get_weather('New York') }

    let(:api_url) { 'http://api.weatherapi.com/v1/current.json' }
    let(:city) { 'New York' }
    let(:wrong_city) { 'Neww Yorkk' }
    let(:ok_mocked_status) { 200 }
    let(:bad_request_mocked_status) { 400 }
    let(:unauthorized_request_mocked_status) { 401 }
    let(:mocked_headers) do
      {
        "Content-Type" => "application/json",
        "Accept" => "application/json",
        "Key" => ENV["WEATHER_API_KEY"]
      }
    end
    let(:wrong_mocked_headers) do
      {
        "Content-Type" => "application/json",
        "Accept" => "application/json",
        "Key" => "324234234532453453245234534534"
      }
    end
    let(:ok_mocked_body) { "{\"location\":{\"name\":\"New York\",\"region\":\"New York\",\"country\":\"United States of America\",\"lat\":40.71,\"lon\":-74.01,\"tz_id\":\"America/New_York\",\"localtime_epoch\":1646213445,\"localtime\":\"2022-03-02 4:30\"},\"current\":{\"last_updated_epoch\":1646213400,\"last_updated\":\"2022-03-02 04:30\",\"temp_c\":6.7,\"temp_f\":44.1,\"is_day\":0,\"condition\":{\"text\":\"Partly cloudy\",\"icon\":\"//cdn.weatherapi.com/weather/64x64/night/116.png\",\"code\":1003},\"wind_mph\":15.0,\"wind_kph\":24.1,\"wind_degree\":310,\"wind_dir\":\"NW\",\"pressure_mb\":1013.0,\"pressure_in\":29.92,\"precip_mm\":0.0,\"precip_in\":0.0,\"humidity\":65,\"cloud\":25,\"feelslike_c\":4.0,\"feelslike_f\":39.2,\"vis_km\":16.0,\"vis_miles\":9.0,\"uv\":1.0,\"gust_mph\":14.5,\"gust_kph\":23.4}}" }
    let(:bad_request_mocked_body) { "{\"error\":{\"code\":1006,\"message\":\"No matching location found.\"}}" }
    let(:unauthorized_request_mocked_body) { "{\"error\":{\"code\":1002,\"message\":\"API key is invalid or not provided.\"}}" }

    # before do
      # GetCityWeatherData.setup do |config|
      #   # p ENV["WEATHER_API_KEY"]
      #   config.api_key = ENV["WEATHER_API_KEY"]
      # end

      # stub_request(:get, "http://api.weatherapi.com/v1/current.json?q=#{city}")
      #   .with(
      #     headers: mocked_headers
      #   )
      #   .to_return(status: ok_mocked_status, body: ok_mocked_body, headers: {})
    # end

    it "returns correctly city weather data", :vcr do
      stub_request(:get, "#{api_url}?q=#{city}")
        .with(headers: mocked_headers)
        .to_return(status: ok_mocked_status, body: ok_mocked_body, headers: {})

      city_weather_data_response = GetCityWeatherData.get_weather(city)
      # p city_weather_data_response
      expect(city_weather_data_response).to be_an_instance_of(Hash)
      # expect(city_weather_data_response).to be_kind_of(Hash)
      expect(city_weather_data_response[:weather]).to have_key(:temp_c)
      expect(city_weather_data_response[:weather]).to have_key(:condition)
    end

    it "returns an API error message - wrong location provided", :vcr do
      stub_request(:get, "#{api_url}?q=#{wrong_city}")
        .with(headers: mocked_headers)
        .to_return(status: bad_request_mocked_status, body: bad_request_mocked_body, headers: {})

      city_weather_data_response = GetCityWeatherData.get_weather(wrong_city)
      # p city_weather_data_response
      expect(city_weather_data_response).to be_an_instance_of(String)
      expect(city_weather_data_response).to eq("No matching location found.")
    end

    it "returns an API error message - invalid API key provided", :vcr do
      stub_request(:get, "#{api_url}?q=#{wrong_city}")
        .with(headers: wrong_mocked_headers)
        .to_return(status: unauthorized_request_mocked_status, body: unauthorized_request_mocked_body, headers: {})

      city_weather_data_response = GetCityWeatherData.get_weather(wrong_city)
      # p city_weather_data_response
      expect(city_weather_data_response).to be_an_instance_of(String)
      expect(city_weather_data_response).to eq("API key is invalid or not provided.")
    end
  end
end
