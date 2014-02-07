require 'helper'

class TestProduct < Test::Unit::TestCase

  def test_search
    results = Retailigence::Product.search(
      userlocation: '37.3323,-122.0312',
      requestorid: 'test',
      name: 'Xbox One'
    )

    assert_equal Retailigence::SearchResult, results.class
  end

end
