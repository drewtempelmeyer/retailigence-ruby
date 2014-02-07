module Retailigence
  class Product < Model
    attributes :id, :externalproductid, :model, :weight, :msrpCurrency, :name,
      :descriptionLong, :barcode, :brand, :images, :sku, :descriptionShort,
      :url, :productType

    def self.search(params = {})
      results = get('products', params)
      products = results['RetailigenceSearchResult']['results'].map do |result|
        Product.new(result['SearchResult']['product'])
      end

      SearchResult.new(products)
    end
  end
end
