# -*- encoding : utf-8 -*-
module Retailigence #:nodoc:
  # A product from the Retailigence API
  #
  # === Attributes
  # * <tt>id</tt> - The Product's GUID
  # * <tt>externalproductid</tt> - The Retailer provided product ID
  # * <tt>weight</tt> - The item's weight (if known)
  # * <tt>price</tt> - Manufacturer suggested retail price
  # * <tt>msrp_currency</tt> - Currency respective of <tt>price</tt>
  # * <tt>name</tt> - Name of the product
  # * <tt>description_short</tt> - Short description of the product
  # * <tt>description_long</tt> - Long description of the product
  # * <tt>barcode</tt> - The barcode/UPC label value
  # * <tt>brand</tt> - The brand/manufacturer of the product
  # * <tt>images</tt> - Array of Image
  # * <tt>sku</tt> - Product's SKU number
  # * <tt>distance</tt> - The product's Distance
  # * <tt>url</tt> - URL to purchase or view more details about the product
  # * <tt>product_type</tt> - String array of product types
  # * <tt>location</tt> - Location returned from the search results
  class Product < Model
    attributes :id, :externalproductid, :model, :weight, :msrpCurrency, :name,
               :descriptionLong, :barcode, :brand, :images, :sku, :distance,
               :price, :descriptionShort, :url, :productType, :productCategory,
               :location

    # Search products nearby the provided <tt>userlocation</tt>
    #
    # === Parameters
    # See the official Retailigence documentation for a list of parameters.
    #
    # === Return
    # SearchResult with <tt>results</tt> being an array of Products
    #
    # === Example
    #   search_results = Retailigence::Product.search(
    #     userlocation: '37.3323,-122.0312',
    #     requestorid: 'test',
    #     name: 'Xbox One'
    #   )
    #
    #   search_results.results # => [#<Retailigence::Product>, #<Retailigence::Product>]
    def self.search(params = {})
      results = get('products', params)

      products = results['RetailigenceSearchResult']['results'].map do |result|
        product = result['SearchResult']['product']

        product[:distance] = result['SearchResult']['distance']
        product[:price]    = result['SearchResult']['price']
        product[:location] = result['SearchResult']['location']

        Product.new(product)
      end

      SearchResult.new(products)
    end

    def distance=(distance) #:nodoc:
      @distance = Distance.new(distance)
    end

    def location=(location) #:nodoc:
      @location = Location.new(location)
    end

    # Retrieve inventory information for the product and current
    # <tt>location</tt>.
    #
    # === Returns
    # Inventory
    def inventory
      @inventory ||= Inventory.fetch(id, location.id)
    end

    ##
    # Images
    #

    def images=(images) #:nodoc:
      @images = images.map { |image| Image.new(image['ImageInfo']) }
    end

    # Get the small image for the Product
    #
    # === Returns
    # Image
    #
    # === Example
    #   product.small_image
    #     # => "http://images.bestbuy.com/BestBuy_US/images/products/3021/3021168_54x108_s.gif"
    def small_image
      @images.select { |image| image.image_name == 'SMALL' }.first
    end

    # Get the large image for the Product
    #
    # === Returns
    # Image
    #
    # === Example
    #   product.large_image
    #     # => "http://c.shld.net/rpx/i/s/i/spin/image/spin_prod_837932112"
    def large_image
      @images.select { |image| image.image_name == 'LARGE' }.first
    end
  end
end
