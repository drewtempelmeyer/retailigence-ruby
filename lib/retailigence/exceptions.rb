module Retailigence #:nodoc:
  # Raised when Retailigence doesn't find any results
  class NoResults < StandardError; end

  # Raised when any other exception occurs from the API
  class APIException < StandardError; end
end
