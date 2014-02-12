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
  #   # => "Microsoft Xbox One - Console"
  class SearchResult
    include Enumerable

    # An array of search results.
    #
    # === Example
    #   search_results = Retailigence::Product.search(
    #     userlocation: '37.3323,-122.0312',
    #     requestorid: 'test',
    #     name: 'Xbox One'
    #   )
    #
    #   search_results.results # => [#<Retailigence::Product>, #<Retailigence::Product>]
    attr_accessor :results

    # Create a new SearchResult with the provided <tt>results</tt>.
    def initialize(results = nil)
      @results = results
    end

    def each(&block) #:nodoc:
      results.each(&block)
    end
  end
end
