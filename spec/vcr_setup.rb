require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'vcr_cassettes'
  c.default_cassette_options = {
    serialize_with: :json
  }
  c.hook_into :webmock
  c.configure_rspec_metadata!
  # c.allow_http_connections_when_no_cassette = true
end