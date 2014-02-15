# -*- encoding : utf-8 -*-
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

module Retailigence #:nodoc:
  # Retailigence's API Version
  API_VERSION = '2.1'

  class << self
    # Stores the current Retailigence Configuration
    attr_accessor :configuration

    # Configure Retailigence. See Configuration for available configuration options
    #
    # === Example
    #   Retailigence.configure do |config|
    #     config.api_key = 'your-retailigence-api-key'
    #   end
    def configure
      @configuration ||= Configuration.new
      yield @configuration
    end
  end
end
