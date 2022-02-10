# GetCityWeatherData

This gem gets weather data from WeatherAPI (https://www.weatherapi.com/) for a specified city.

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
client = GetCityWeatherData::Client.new(city: 'New York', api_key: ENV["WEATHER_API_KEY"])
response = client.get_weather
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Dev-Denis-Paul/get-city-weather-data-gem.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
