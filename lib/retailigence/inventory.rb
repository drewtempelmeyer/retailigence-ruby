module Retailigence #:nodoc:
  # Retrieve the inventory for a product at a specific location.
  #
  # === Attributes
  # * <tt>product_id</tt> - The Product#id
  # * <tt>retailer_id</tt> - The Retailer#id
  # * <tt>location_id</tt> - The Location#id
  # * <tt>price</tt> - The price
  # * <tt>currency</tt> - The price's respective currency
  # * <tt>quantity</tt> - Number of items in stock
  # * <tt>quantity_text</tt> - Detail about the current stock
  # * <tt>product_name</tt> - The Product#name
  class Inventory < Model
    attributes :product_id, :retailer_id, :location_id, :price, :currency,
               :quantity, :quantityText, :productName

    # Retrieve the inventory information for the provided <tt>product_id</tt>
    # and <tt>location_id</tt>
    #
    # === Returns
    # Inventory
    def self.fetch(product_id = nil, location_id = nil)
      params = {
        productId: product_id,
        locationId: location_id
      }

      results = get('inventory', params)['RetailigenceAPIResult']['results']

      Inventory.new(results.first['ProductLocation'])
    end
  end
end
