module Retailigence #:nodoc:
  # Configure Retailigence with your credentials.
  #
  # === Example
  #   Retailigence.configure do |config|
  #     config.api_key = 'yourapikeyhere'
  #     config.production = false # Use the test route
  #   end
  class Configuration
    attr_accessor :api_key
    attr_writer   :production

    def production?
      @production == true
    end

    def test?
      !production?
    end
  end
end
