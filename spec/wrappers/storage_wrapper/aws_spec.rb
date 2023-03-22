# frozen_string_literal: true

RSpec.describe StorageWrapper::Aws do
  describe '#initialize' do
    it 'raises error' do
      expect do
        subject.new
      end.to raise_error(NotImplementedError)
    end
  end
end
