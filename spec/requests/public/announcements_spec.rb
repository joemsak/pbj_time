require 'rails_helper'

RSpec.describe "Public::Announcements", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/public/announcements/index"
      expect(response).to have_http_status(:success)
    end
  end

end
