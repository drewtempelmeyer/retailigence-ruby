module Retailigence #:nodoc:
  class Retailer < Model
    attributes :id, :logo, :phs, :name, :logosq, :locations

    def locations=(locations) #:nodoc:
      @locations = locations.map { |location| Location.new(location['Location']) }
    end
  end
end
