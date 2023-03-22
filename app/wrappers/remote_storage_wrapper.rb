# frozen_string_literal: true

class RemoteStorageWrapper < ApplicationWrapper
  attr_reader :remote_storage

  def initialize(storage_type = 'gcp')
    @remote_storage = "RemoteStorage::#{storage_type.titleize}Storage".constantize.new
  end

  def list_objects
    remote_storage.list_objects
  end
end
