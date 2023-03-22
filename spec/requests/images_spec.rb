# frozen_string_literal: true

RSpec.describe 'Images', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/images'

      expect(response).to have_http_status(:success)
    end
  end
end
