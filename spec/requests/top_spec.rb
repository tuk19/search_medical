require 'rails_helper'

RSpec.describe "Tops", type: :request do
  describe "GET /index" do

    before do
      get root_path
    end

    example "topページへアクセスできること"  do
      expect(response).to have_http_status(:success)
    end

    example "ログイン機能が含まれること" do
      expect(response.body).to include("ログイン")
    end
  end

end
