require 'retailigence/version'
require 'retailigence/configuration'
require 'retailigence/exceptions'
require 'retailigence/model'
require 'retailigence/search_result'
require 'retailigence/product'
require 'retailigence/distance'
require 'retailigence/location'
require 'retailigence/retailer'
require 'retailigence/address'
require 'retailigence/image'
require 'retailigence/inventory'

module Retailigence
  API_VERSION = '2.1'

  class << self
    attr_accessor :configuration

    # Configure Retailigence. See Configuration for available configuration options
    def configure
      @configuration ||= Configuration.new
      yield @configuration
    end
  end
end
