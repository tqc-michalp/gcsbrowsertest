# frozen_string_literal: true

require 'google/cloud/storage'

credentials = Rails.root.join('google_application_credentials.json')
raise LoadError, 'GCP Storage credentials' unless File.exist?(credentials)

project_id = ENV.fetch('GCP_STORAGE_PPROJECT_ID')
bucket_name = ENV.fetch('GCP_STORAGE_BUCKET_NAME')

Google::Cloud::Storage.configure do |cfg|
  cfg.credentials = credentials.to_s
  cfg.project_id  = project_id
end

storage = Google::Cloud::Storage.new

GCP_STORAGE_CLIENT = storage
                     .bucket(bucket_name)
                     .freeze
