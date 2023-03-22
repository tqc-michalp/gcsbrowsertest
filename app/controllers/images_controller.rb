# frozen_string_literal: true

class ImagesController < ApplicationController
  def index
    collection = StorageWrapper.new.fetch_images.map do |image|
      ImageFacade.new(image)
    end

    @pagy, @images = pagy_array(collection)
  end

  def show
    @image = ImageFacade.new(
      StorageWrapper.new.fetch_by_file_name(
        Base64.urlsafe_decode64(params[:name])
      )
    )
  end
end
