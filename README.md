# GetCityWeatherData

A gem for WeatherAPI. Use when you need to get weather data for a specified city.
 
Gem requires an API key from: [WeatherAPI.com](https://www.weatherapi.com/)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'get_city_weather_data', git: 'https://github.com/Dev-Denis-Paul/get-city-weather-data-gem', branch: :main
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install get_city_weather_data

## Usage

```ruby
# config API key
api_key = "WEATHER_API_KEY"
GetCityWeatherData.setup do |config|
    config.api_key = api_key # use env variables for security e.g. ENV["WEATHER_API_KEY"]
end

# succesful API response
response_weather_data = GetCityWeatherData.get_weather('New York')
# response_weather_data => {:last_updated_epoch=>1645694100, :last_updated=>"2022-02-24 04:15", :temp_c=>0.0, :temp_f=>32.0, :is_day=>0, :condition=>{:text=>"Partly cloudy", :icon=>"//cdn.weatherapi.com/weather/64x64/night/116.png", :code=>1003}, :wind_mph=>12.5, :wind_kph=>20.2, :wind_degree=>340, :wind_dir=>"NNW", :pressure_mb=>1027.0, :pressure_in=>30.33, :precip_mm=>0.0, :precip_in=>0.0, :humidity=>49, :cloud=>75, :feelslike_c=>-5.2, :feelslike_f=>22.6, :vis_km=>16.0, :vis_miles=>9.0, :uv=>1.0, :gust_mph=>16.1, :gust_kph=>25.9}

# in case the specified city is not valid then the API response will return the specific error message e.g. response_weather_data => "No matching location found."
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Testing

When running the tests for the first time follow the next steps: 
- comment: let(:city_weather_data_response) { GetCityWeatherData.get_weather('New York') }
- uncomment: city_weather_data_response = GetCityWeatherData.get_weather('New York')
- run test spec file env variable: WEATHER_API_KEY=*** rspec spec/get_city_weather_data_spec.rb -fd
After following the steps above reverse the changes and run the tests normally with: spec spec/get_city_weather_data_spec.rb -fd

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Dev-Denis-Paul/get-city-weather-data-gem.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
