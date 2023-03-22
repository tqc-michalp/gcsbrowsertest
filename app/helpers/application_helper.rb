# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend
  def file_prefix
    ENV.fetch('FILE_PREFIX')
  end
end
