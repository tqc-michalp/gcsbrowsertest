# frozen_string_literal: true

class ImageFacade
  class Gcp < ImageFacadeInterface
    def name_url_safe_encoded
      @name_url_safe_encoded ||= Base64.urlsafe_encode64(img.gapi.name)
    end

    def signed_url
      @signed_url ||=
        begin
          storage = Google::Cloud::Storage.new
          storage.signed_url(
            ENV.fetch('GCP_STORAGE_BUCKET_NAME'),
            img.gapi.name,
            method: 'GET',
            expires: 30,
            version: :v4
          )
        end
    end
  end
end
