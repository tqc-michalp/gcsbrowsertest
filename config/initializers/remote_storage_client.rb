# frozen_string_literal: true

require 'google/cloud/storage'

GCP_STORAGE_CLIENT = Google::Cloud::Storage
                     .new
                     .bucket(ENV.fetch('GCP_STORAGE_BUCKET_NAME'))
                     .freeze
