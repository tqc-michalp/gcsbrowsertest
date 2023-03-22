# frozen_string_literal: true

RSpec.describe ImageFacade::Aws do
  describe '.signed_url' do
    it 'raises error' do
      gcp_storage_file = double(Google::Cloud::Storage::File)
      facade = ImageFacade::Aws.new(gcp_storage_file)

      expect do
        facade.signed_url
      end.to raise_error(NotImplementedError)
    end
  end
end
