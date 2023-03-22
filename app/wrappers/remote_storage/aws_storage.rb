# frozen_string_literal: true

module RemoteStorage
  class AwsStorage
    def initialize
      raise NotImplementedError, "#{self.class.name} lack of implementation"
    end
  end
end
