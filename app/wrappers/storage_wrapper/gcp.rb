# frozen_string_literal: true

class StorageWrapper
  class Gcp
    def fetch_images
      @list_objects ||= select_images(GCP_STORAGE_CLIENT.files)
    end

    def fetch_by_file_name(file_name)
      @list_objects ||= GCP_STORAGE_CLIENT.file(file_name)
    end

    private

    def select_images(files)
      files.select { |file| file.gapi.content_type == 'image/jpeg' }
    end
  end
end
