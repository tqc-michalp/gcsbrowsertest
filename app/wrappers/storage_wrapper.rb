# frozen_string_literal: true

class StorageWrapper < ApplicationWrapper
  attr_reader :storage

  def initialize(storage_type = 'gcp')
    @storage = "StorageWrapper::#{storage_type.titleize}".constantize.new
  end

  def fetch_by_file_name(file_name)
    storage.fetch_by_file_name(file_name)
  end

  def fetch_images
    storage.fetch_images
  end
end
