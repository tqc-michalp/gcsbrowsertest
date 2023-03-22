# frozen_string_literal: true

RSpec.describe RemoteStorage::GcpStorage do
  describe '.list_objects' do
    it 'returns all objects' do
      VCR.use_cassette('remote_storage/gcp_storage/list_objects') do
        response = subject.list_objects

        expect(response).to be_instance_of(Google::Cloud::Storage::File::List)
        expect(response.size).to eq(713)
        expect(response.first.gapi).to have_attributes(
          bucket: 'gcsbrowsertest',
          content_type: 'application/octet-stream',
          crc32c: 'u0vxwg==',
          etag: 'CJHHtraxvf0CEAE=',
          generation: 1_677_764_932_248_465,
          id: 'gcsbrowsertest/deadfish.v1i.yolov82/.DS_Store/1677764932248465',
          kind: 'storage#object',
          md5_hash: 'mDGyKZDfSNVXCNjd68cRZA==',
          media_link: 'https://storage.googleapis.com/download/storage/v1/b/gcsbrowsertest/o/deadfish.v1i.yolov82%2F.DS_Store?generation=1677764932248465&alt=media',
          metageneration: 1,
          name: 'deadfish.v1i.yolov82/.DS_Store',
          self_link: 'https://www.googleapis.com/storage/v1/b/gcsbrowsertest/o/deadfish.v1i.yolov82%2F.DS_Store',
          size: 6148,
          storage_class: 'STANDARD'
        )
      end
    end
  end
end
