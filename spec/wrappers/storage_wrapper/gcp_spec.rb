# frozen_string_literal: true

RSpec.describe StorageWrapper::Gcp do
  describe '.fetch_by_file_name' do
    it 'returns image by name' do
      VCR.use_cassette('storage_wrapper/gcp/fetch_by_file_name') do
        name = 'deadfish.v1i.yolov82/test/images/image-0000014_jpg.rf.5e7e47014efa831e04fb8f9c343a54a7.jpg'
        response = subject.fetch_by_file_name(name)

        expect(response).to have_attributes(
          bucket: 'gcsbrowsertest',
          content_type: 'image/jpeg',
          crc32c: '/60YWw==',
          etag: 'CKzwqr2xvf0CEAE=',
          generation: 1_677_764_946_737_196,
          id: 'gcsbrowsertest/deadfish.v1i.yolov82/test/images/image-0000014_jpg.rf.5e7e47014efa831e04fb8f9c343a54a7.jpg/1677764946737196',
          kind: 'storage#object',
          metageneration: 1,
          name:,
          size: 41_163,
          storage_class: 'STANDARD'
        )
      end
    end
  end

  describe '.fetch_images' do
    it 'returns all images' do
      VCR.use_cassette('storage_wrapper/gcp/fetch_images') do
        response = subject.fetch_images

        expect(response.size).to eq(354)
        id = 'gcsbrowsertest/deadfish.v1i.yolov82/test/images/image-0000014_jpg.rf.5e7e47014efa831e04fb8f9c343a54a7.jpg/1677764946737196'
        image = response.select { |img| img.gapi.id == id }.first.gapi
        expect(image).to have_attributes(
          bucket: 'gcsbrowsertest',
          content_type: 'image/jpeg',
          crc32c: '/60YWw==',
          id:,
          kind: 'storage#object',
          md5_hash: 'CXYHqksHFiv0PQ4JKRlufQ==',
          media_link: 'https://storage.googleapis.com/download/storage/v1/b/gcsbrowsertest/o/deadfish.v1i.yolov82%2Ftest%2Fimages%2Fimage-0000014_jpg.rf.5e7e47014efa831e04fb8f9c343a54a7.jpg?generation=1677764946737196&alt=media',
          metageneration: 1,
          name: 'deadfish.v1i.yolov82/test/images/image-0000014_jpg.rf.5e7e47014efa831e04fb8f9c343a54a7.jpg',
          self_link: 'https://www.googleapis.com/storage/v1/b/gcsbrowsertest/o/deadfish.v1i.yolov82%2Ftest%2Fimages%2Fimage-0000014_jpg.rf.5e7e47014efa831e04fb8f9c343a54a7.jpg',
          size: 41_163,
          storage_class: 'STANDARD'
        )
      end
    end
  end
end
