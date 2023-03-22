# frozen_string_literal: true

module RemoteStorage
  class GcpStorage
    def list_objects
      @list_objects ||= GCP_STORAGE_CLIENT.files
    end
  end
end

# RemoteStorage::GcpStorage.new
#     def list_objects
