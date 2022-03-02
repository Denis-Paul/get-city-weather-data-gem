# frozen_string_literal: true
# require 'dotenv'

RSpec.describe GetCityWeatherData do
  it "has a version number" do
    expect(GetCityWeatherData::VERSION).not_to be nil
  end

  describe 'API call' do
    let(:city_weather_data_response) { GetCityWeatherData.get_weather('New York') }

    before do
      GetCityWeatherData.setup do |config|
        # p ENV["WEATHER_API_KEY"]
        config.api_key = ENV["WEATHER_API_KEY"]
      end
    end

    it "returns correctly city weather data", :vcr do
      # city_weather_data_response = GetCityWeatherData.get_weather('New York')
      # p city_weather_data_response
      expect(city_weather_data_response).to be_kind_of(Hash)
      expect(city_weather_data_response).to have_key(:temp_c)
      expect(city_weather_data_response).to have_key(:condition)
    end
  end
end
