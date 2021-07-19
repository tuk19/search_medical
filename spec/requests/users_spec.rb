require 'rails_helper'

RSpec.describe UsersController, type: :request do
  let!(:user) { create(:testuser) }
  describe "GET /index" do
    before do
      sign_in user
      get users_path
    end

    it "indexページが表示できること" do
      expect(response).to have_http_status(:success)
    end

    it "ユーザー情報編集が含まれること" do
      expect(response.body).to include("編集")
    end
  end

end
