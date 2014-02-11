require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'cassettes'
  c.hook_into :typhoeus
  c.filter_sensitive_data('<API_KEY>') { ENV['RETAILIGENCE_API_KEY'] || 'retailigence_api_key' }
end
