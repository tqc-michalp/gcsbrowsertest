# frozen_string_literal: true

RSpec.describe RemoteStorage::AwsStorage do
  describe '#initialize' do
    it 'raises error' do
      expect do
        subject.new
      end.to raise_error(NotImplementedError)
    end
  end
end
