# frozen_string_literal: true

class ImageFacade < ApplicationFacade
  attr_reader :provider

  def initialize(img, provider = :gcp)
    case provider
    when :aws
      @provider = ImageFacade::Aws.new(img)
    when :azure
      @provider = ImageFacade::Azure.new(img)
    when :gcp
      @provider = ImageFacade::Gcp.new(img)
    else
      raise ArgumentError, "Unknown Image provider: #{provider}"
    end
  end

  def signed_url
    provider.signed_url
  end
end
