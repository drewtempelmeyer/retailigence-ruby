require 'test/unit'
require 'pry'
# require 'vcr_setup'

require 'retailigence_ruby'

Retailigence.configure do |config|
  config.api_key    = ENV['RETAILIGENCE_API_KEY'] || 'retailigence_api_key'
  config.production = false
end
