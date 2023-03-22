# frozen_string_literal: true

RSpec.describe ImageFacade::Gcp do
  let(:image) { double('Google::Cloud::Storage::File', gapi: double('gapi', name: 'image.jpg')) }
  let(:storage) { double('Google::Cloud::Storage') }
  let(:signed_url) { 'https://example.com/image.jpg?signature=abc123' }
  let(:bucket_name) { 'asdf' }

  before do
    stub_const('ENV', { 'GCP_STORAGE_BUCKET_NAME' => bucket_name })
    allow(Google::Cloud::Storage).to receive(:new).and_return(storage)
    allow(storage).to receive(:signed_url).and_return(signed_url)
  end

  it 'returns a signed URL for the image' do
    gcp_facade = described_class.new(image)
    expect(gcp_facade.signed_url).to eq(signed_url)
    expect(storage).to have_received(:signed_url).with(
      bucket_name,
      image.gapi.name,
      method: 'GET',
      expires: 30,
      version: :v4
    )
  end
end
