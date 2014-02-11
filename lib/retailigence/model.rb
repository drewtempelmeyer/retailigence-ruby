require 'typhoeus'
require 'json'

module Retailigence #:nodoc:
  class Model
    # Initialize an object with the provided <tt>params</tt>. For the available
    # <tt>params</tt>, see the model's <tt>Attributes</tt>.
    def initialize(params = {})
      params.each do |key, value|
        mapped_key = underscore(key)
        send("#{mapped_key}=".to_sym, value) if safe_attribute?(mapped_key)
      end
    end

    class << self
      attr_accessor :safe_attributes

      # Creates a list of safe attributes for assign using #initialize.
      def attributes(*attrs)
        @safe_attributes ||= []

        attrs.each do |attr_name|
          name = underscore(attr_name.to_s).to_sym

          attr_accessor name
          @safe_attributes << name
        end
      end

      # Perform a request using Typhoeus.
      #
      # === Arguments
      # * <tt>method</tt> - Symbol for the request method.
      # * <tt>action</tt> - The path to request
      # * <tt>params</tt> - Hash of params to send with the request
      def request(method = :get, action = nil, params = {})
        params[:apikey] = Retailigence.configuration.api_key
        params[:format] = 'JSON'

        url = "http://#{host}/v#{Retailigence::API_VERSION}/#{action}"

        response = Typhoeus.send(method, url, params: params)
        JSON.parse response.body
      end

      # Convenience method for performing a GET request. See #request
      def get(action = nil, params = {})
        request(:get, action, params)
      end

      # Convert the camelCase to its underscore/snake_case equivalent.
      def underscore(word)
        word.gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
            .gsub(/([a-z\d])([A-Z])/, '\1_\2')
            .tr('-', '_').downcase
      end

      private

      def host
        host =
          if Retailigence.configuration.production?
            'api'
          else
            'apitest'
          end

        "#{host}.retailigence.com"
      end
    end

    private

    def underscore(word)
      self.class.underscore(word.to_s).to_sym
    end

    def safe_attribute?(key)
      self.class.safe_attributes.include?(key)
    end
  end
end
