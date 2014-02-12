# Retailigence

Ruby library for interacting with [Retailigence](http://retailigence.com) API v2.1.

**NOTE:** You'll need an API key from Retailigence. You can [request one from here](http://www.retailigence.com/developers/request-key/).

## Installation

Add this line to your application's Gemfile:

    gem 'retailigence_ruby', '~> 0.0.1'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install retailigence_ruby

## Configuring

Configuration only needs to be defined once.

```
Retailigence.configure do |config|
	config.api_key = 'your-api-key'
	# config.production = false # Uncomment this line if you want to use the test environment
end
```

If you're using Rails, it's recommended you place the above code in an initializer such as `config/initializers/retailigence.rb`.

## Searching Products

Searching products will return a `SearchResult` with a collection of `Retailigence::Product` for the results. See the `Product` model for available attributes and methods.

```
search_results = Retailigence::Product.search(
	userlocation: '37.3323,-122.0312',
	requestorid: 'test',
	name: 'Xbox One'
)

search_results.each do |product|
	puts product.name
end

# => "Xbox One - Console"
# => "FIFA 2014 (Xbox One)"
```

## Searching Locations

Searching locations will return a `SearchResult` with a collection of `Retailigence::Retailer` for the results. Locations are embedded within the retailer and can be accessed by calling `retailer.locations`. See the `Retailer` and `Location` models available attributes and methods.

```
search_results = Retailigence::Location.search(
	userlocation: '37.3323,-122.0312',
	requestorid: 'test',
	keywords: 'Best Buy'
)

search_results.each do |retailer|
	puts retailer.name
	puts retailer.locations
end

# => "Best Buy"
# => #<Retailigence::Location>
# => #<Retailigence::Location>
```
	

## Contributing

1. Fork it ( https://github.com/drewtempelmeyer/retailigence_ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
