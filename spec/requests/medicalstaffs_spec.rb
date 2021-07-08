require 'rails_helper'

RSpec.describe "Medicalstaffs", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/medicalstaffs/index"
      expect(response).to have_http_status(:success)
    end
  end

end
