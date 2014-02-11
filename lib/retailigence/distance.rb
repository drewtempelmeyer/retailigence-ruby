module Retailigence #:nodoc:
  # Representation of the distance from the <tt>userlocation</tt> and the
  # respective Product or Location
  #
  # === Attributes
  # * <tt>distance</tt> - A float value based on the distance <tt>units</tt>
  # * <tt>units</tt> - String of distance measurement. Example: "miles", "meters", etc.
  class Distance < Model
    attributes :distance, :units
  end
end
