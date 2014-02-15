# -*- encoding : utf-8 -*-
module Retailigence #:nodoc:
  # Configure Retailigence with your credentials.
  #
  # === Example
  #   Retailigence.configure do |config|
  #     config.api_key = 'yourapikeyhere'
  #     config.production = false # Use the test route
  #   end
  class Configuration
    # The API key issued to you by Retailigence
    attr_accessor :api_key

    # Wether or not to use the production Retailigence API
    attr_writer :production

    # Returns true if using the production API
    def production?
      @production ||= true
    end

    # Returns true if using the test API
    def test?
      !production?
    end
  end
end
