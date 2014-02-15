# -*- encoding : utf-8 -*-
module Retailigence #:nodoc:
  # A product image returned by the API
  #
  # === Attributes
  # * <tt>image_name</tt> - The image name. Normally either "IMAGESMALL" or "IMAGELARGE"
  # * <tt>link</tt> - The URL of the image
  class Image < Model
    attributes :imageName, :link
  end
end
