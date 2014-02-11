require 'helper'

class TestLocation < Test::Unit::TestCase
  def setup
    VCR.use_cassette('location_search') do
      @results = Retailigence::Location.search(
        userlocation: '37.3323,-122.0312',
        requestorid: 'test',
        keywords: 'Volkswagen'
      )
    end

    @first_result   = @results.first
    @first_location = @first_result.locations.first
  end

  def test_search
    assert_equal Retailigence::SearchResult, @results.class
  end

  def test_locations
    assert_equal Retailigence::Location, @first_location.class
  end

  def test_distance
    assert_equal 3.683537289443949, @first_location.distance.distance
    assert_equal 'miles', @first_location.distance.units
  end

  def test_retailer
    assert_equal 'Frys', @first_location.retailer.name
  end

  def test_location_coordinates
    assert_equal 37.380241, @first_location.latitude
    assert_equal -122.00187, @first_location.longitude
  end

  def test_address
    address = @first_location.address

    assert_equal '1077 E Arques Ave', address.address1
    assert_equal 'Sunnyvale', address.city
    assert_equal 'CA', address.state
    assert_equal '94085', address.postal
    assert_equal 'US', address.country
  end
end
