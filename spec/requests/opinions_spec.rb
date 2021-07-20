require 'rails_helper'

RSpec.describe 'Opinions', type: :request do
  describe 'GET /create' do
    it 'returns http success' do
      get '/opinions/create'
      expect(response).to have_http_status(:success)
    end
  end
end
