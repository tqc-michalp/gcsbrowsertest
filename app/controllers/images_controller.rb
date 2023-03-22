# frozen_string_literal: true

class ImagesController < ApplicationController
  include ApplicationHelper
  def index
    collection = StorageWrapper.new.fetch_images.map do |image|
      ImageFacade.new(image)
    end

    @pagy, @images = pagy_array(collection)
  end

  def show
    gcp_file = StorageWrapper.new.fetch_by_file_name(
      Base64.urlsafe_decode64(params[:name])
    )
    @image = ImageFacade.new(gcp_file)

    respond_to do |format|
      format.html
      format.jpeg do
        send_data(gcp_file.download.read, filename: "#{file_prefix}_image_#{gcp_file.name[..12]}.jpeg",
                                          type: 'image/jpeg')
      end
    end
  end
end
