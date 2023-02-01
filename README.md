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
# response_weather_data => "{:weather=>{:last_updated_epoch=>1648537200, :last_updated=>\"2022-03-29 03:00\", :temp_c=>-3.3, :temp_f=>26.1, :is_day=>0, :condition=>{:text=>\"Overcast\", :icon=>\"//cdn.weatherapi.com/weather/64x64/night/122.png\", :code=>1009}, :wind_mph=>18.6, :wind_kph=>29.9, :wind_degree=>320, :wind_dir=>\"NW\", :pressure_mb=>1019.0, :pressure_in=>30.08, :precip_mm=>0.0, :precip_in=>0.0, :humidity=>52, :cloud=>100, :feelslike_c=>-10.0, :feelslike_f=>13.9, :vis_km=>16.0, :vis_miles=>9.0, :uv=>1.0, :gust_mph=>18.8, :gust_kph=>30.2}, :location=>{:name=>\"New York\", :region=>\"New York\", :country=>\"United States of America\", :lat=>40.71, :lon=>-74.01, :tz_id=>\"America/New_York\", :localtime_epoch=>1648541473, :localtime=>\"2022-03-29 4:11\"}}"

# in case the specified city is not valid then the API response will return the specific error message e.g. response_weather_data => "No matching location found."
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Testing

Run spec tests with env variable in which the API key is specified: `WEATHER_API_KEY=*** rspec spec/get_city_weather_data_spec.rb -fd`

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Dev-Denis-Paul/get-city-weather-data-gem.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
