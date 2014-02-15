require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'test/cassettes'
  c.hook_into :typhoeus
  c.default_cassette_options = {
    match_requests_on: [ :method, :path ]
  }
  c.filter_sensitive_data('<API_KEY>') { ENV['RETAILIGENCE_API_KEY'] || 'retailigence_api_key' }
end
