require 'helper'

class TestInventory < Test::Unit::TestCase

  def setup
    VCR.use_cassette('inventory') do
      @inventory = Retailigence::Inventory.fetch(
        '6cd9f7a2-49de-4c2c-b5a6-7f4d13f9e89a', # Product ID
        '869b02ce-4908-4339-8891-6404602ea7e4' # Location ID
      )
    end
  end

  def test_inventory
    assert_equal 'USD', @inventory.currency
    assert_equal '869b02ce-4908-4339-8891-6404602ea7e4', @inventory.location_id
    assert_equal '6cd9f7a2-49de-4c2c-b5a6-7f4d13f9e89a', @inventory.product_id
    assert_equal 'Xbox One', @inventory.product_name
    assert_equal 'Out of stock', @inventory.quantity_text
    assert_equal '499.99', @inventory.price
  end
end
