# frozen_string_literal: true

class ImageFacade
  class ImageFacadeInterface
    attr_reader :img

    def initialize(img)
      @img = img
    end

    def name_url_safe_encoded
      raise NotImplementedError, "#{self.class.name} must implement #{__method__}"
    end

    def signed_url
      raise NotImplementedError, "#{self.class.name} must implement #{__method__}"
    end
  end
end
