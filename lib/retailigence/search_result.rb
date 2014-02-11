module Retailigence #:nodoc:
  # Returns search results from using the ::search methods from models.
  #
  # === Example
  #   results = Retailigence::Product.search(
  #     userlocation: '37.3323,-122.0312',
  #     requestorid: 'test',
  #     name: 'Xbox One'
  #   ) # => #<Retailigence::SearchResult @results=[#<Retailigence::Product>]
  #
  #   results.each do |product|
  #     puts product.name
  #   end
  #
  #   "Microsoft Xbox One - Console"
  class SearchResult
    include Enumerable

    attr_accessor :results

    def initialize(results = nil)
      @results = results
    end

    def each(&block)
      results.each(&block)
    end
  end
end
