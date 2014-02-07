module Retailigence
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
