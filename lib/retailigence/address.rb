# -*- encoding : utf-8 -*-
module Retailigence #:nodoc:
  # Represents an address returned from Retailigence. The address is normally
  # embedded within a Location object.
  #
  # === Attributes
  # * <tt>address1</tt> - The street address of the Location
  # * <tt>city</tt> - The city of the Location
  # * <tt>state</tt> - The state of the Location
  # * <tt>postal</tt> - The postal code (ZIP code) of the Location
  # * <tt>country</tt> - The country of the Location
  class Address < Model
    attributes :address1, :city, :state, :postal, :country
  end
end
