module Retailigence #:nodoc:
  # A location result from the Retailigence API
  #
  # === Attributes
  # * <tt>id</tt> - Unique identifier for the location
  # * <tt>timezone</tt> - Timezone of the location
  # * <tt>distance</tt> - Distance object calculated based off the <tt>userlocation</tt> param
  # * <tt>phone</tt> - Location's phone number
  # * <tt>t_nav_link</tt> - URL to get directions from your current position to the location's position
  # * <tt>location</tt> - Contains the latitude and longitude for the location. Using the <tt>latitude</tt> and <tt>longitude</tt> attributes are preferred
  # * <tt>address</tt> - An Address object containing the physical postal address
  # * <tt>hours</tt> - Colon separated operating hours
  # * <tt>map_link</tt> - Google Maps URL for the location's address
  # * <tt>name</tt> - Name of the location
  # * <tt>retailer</tt> - Retailer
  # * <tt>retlocationid</tt> - External location ID provided by the Retailer
  # * <tt>latitude</tt> - The location's latitude
  # * <tt>longitide</tt> - The location's longitude
  class Location < Model
    attributes :id, :timezone, :distance, :phone, :tNavLink, :location,
      :address, :hours, :mapLink, :name, :retailer, :retlocationid, :latitude,
      :longitude

    # Search locations and retailers based on the <tt>params</tt> passed.
    #
    # === Params
    # See the documentation from Retailigence for all possible parameters
    #
    # === Returns
    # SearchResult with <tt>results</tt> being an array of Retailer
    def self.search(params = {})
      results = get('locations', params)

      retailers = results['RetailigenceAPIResult']['results'].map do |result|
        Retailer.new(result['Retailer'])
      end

      SearchResult.new(retailers)
    end

    def retailer=(retailer) #:nodoc:
      @retailer = Retailer.new(retailer)
    end

    def distance=(distance) #:nodoc:
      @distance = Distance.new(distance)
    end

    def address=(address) #:nodoc:
      @address = Address.new(address)
    end

    # Convert the locations hash to latitude and longitude
    def location=(location) #:nodoc:
      @latitude  = location['latitude']
      @longitude = location['longitude']
      @location  = location
    end

  end
end
