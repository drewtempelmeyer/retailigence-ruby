module Retailigence #:nodoc:
  class Product < Model
    attributes :id, :externalproductid, :model, :weight, :msrpCurrency, :name,
               :descriptionLong, :barcode, :brand, :images, :sku, :distance,
               :price, :descriptionShort, :url, :productType, :location

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
