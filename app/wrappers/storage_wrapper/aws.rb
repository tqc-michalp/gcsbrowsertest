# frozen_string_literal: true

class StorageWrapper
  class Aws
    def initialize
      raise NotImplementedError, "#{self.class.name} lack of implementation"
    end
  end
end
