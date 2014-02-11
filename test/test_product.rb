require 'helper'

class TestProduct < Test::Unit::TestCase

  def setup
    VCR.use_cassette('product_search') do
      @results = Retailigence::Product.search(
        userlocation: '37.3323,-122.0312',
        requestorid: 'test',
        name: 'Xbox One'
      )
    end

    @product = @results.first
  end

  def test_search
    assert_equal Retailigence::SearchResult, @results.class
  end

  def test_distance
    assert_equal 'miles', @product.distance.units
  end

  def test_inventory
    VCR.use_cassette('product_inventory') do
      assert_equal Retailigence::Inventory, @product.inventory.class
    end
  end
end
