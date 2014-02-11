module Retailigence #:nodoc:
  # A retailer is the parent object for locations. For example, "Best Buy"
  # is the retailer and all of their stores are <tt>locations</tt>.
  #
  # === Attributes
  # * <tt>id</tt> - The retailer ID
  # * <tt>logo</tt> - The retailer's logo
  # * <tt>name</tt> - The name of the retailer. Example: "Best Buy"
  # * <tt>logosq</tt> - The retailer's logo in square dimensions
  # * <tt>locations</tt> - An array of Location objects
  class Retailer < Model
    attributes :id, :logo, :name, :logosq, :locations

    def locations=(locations) #:nodoc:
      @locations = locations.map { |location| Location.new(location['Location']) }
    end
  end
end
