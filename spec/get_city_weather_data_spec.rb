# frozen_string_literal: true
require 'dotenv'
require 'webmock/rspec'

RSpec.describe GetCityWeatherData do
  it "has a version number" do
    expect(GetCityWeatherData::VERSION).not_to be nil
  end

  describe 'API call' do
    # let(:city_weather_data_response) { GetCityWeatherData.get_weather('New York') }

    let(:city) { 'New York' }
    let(:mocked_status) { 200 }
    let(:mocked_headers) do
      {
        "Content-Type" => "application/json",
        "Accept" => "application/json",
        "Content-Type" => "application/json",
        "Key" => ENV["WEATHER_API_KEY"]
      }
    end
    let(:mocked_body) { "{\"location\":{\"name\":\"New York\",\"region\":\"New York\",\"country\":\"United States of America\",\"lat\":40.71,\"lon\":-74.01,\"tz_id\":\"America/New_York\",\"localtime_epoch\":1646213445,\"localtime\":\"2022-03-02 4:30\"},\"current\":{\"last_updated_epoch\":1646213400,\"last_updated\":\"2022-03-02 04:30\",\"temp_c\":6.7,\"temp_f\":44.1,\"is_day\":0,\"condition\":{\"text\":\"Partly cloudy\",\"icon\":\"//cdn.weatherapi.com/weather/64x64/night/116.png\",\"code\":1003},\"wind_mph\":15.0,\"wind_kph\":24.1,\"wind_degree\":310,\"wind_dir\":\"NW\",\"pressure_mb\":1013.0,\"pressure_in\":29.92,\"precip_mm\":0.0,\"precip_in\":0.0,\"humidity\":65,\"cloud\":25,\"feelslike_c\":4.0,\"feelslike_f\":39.2,\"vis_km\":16.0,\"vis_miles\":9.0,\"uv\":1.0,\"gust_mph\":14.5,\"gust_kph\":23.4}}" }

    before do
      # GetCityWeatherData.setup do |config|
      #   # p ENV["WEATHER_API_KEY"]
      #   # config.api_key = ENV["WEATHER_API_KEY"]
      # end

      stub_request(:get, "http://api.weatherapi.com/v1/current.json?q=#{city}")
        .with(
          headers: mocked_headers
        )
        .to_return(status: mocked_status, body: mocked_body, headers: {})
    end

    it "returns correctly city weather data", :vcr do
      city_weather_data_response = GetCityWeatherData.get_weather(city)
      # p city_weather_data_response
      expect(city_weather_data_response).to be_kind_of(Hash)
      expect(city_weather_data_response).to have_key(:temp_c)
      expect(city_weather_data_response).to have_key(:condition)
    end
  end
end
