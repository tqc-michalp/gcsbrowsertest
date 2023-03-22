# frozen_string_literal: true

class ImagesController < ApplicationController
  def index
    collection = StorageWrapper.new.fetch_images.map do |image|
      ImageFacade.new(image)
    end

    @pagy, @images = pagy_array(collection)
  end
end
