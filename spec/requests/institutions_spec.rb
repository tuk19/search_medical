require 'rails_helper'

RSpec.describe "Institutions", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/institutions/index"
      expect(response).to have_http_status(:success)
    end
  end

end
