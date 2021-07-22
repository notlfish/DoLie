require 'rails_helper'

RSpec.describe "Followings", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/followings/create"
      expect(response).to have_http_status(:success)
    end
  end

end
