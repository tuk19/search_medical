require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { create(:testuser) }

  describe "GET /index" do
    before do
      sign_in user
      get users_path
    end

    example "indexページが表示できること" do
      expect(response).to have_http_status(:success)
    end

    example "ユーザー情報が含まれること" do
      expect(response.body).to include(user.name)
      expect(response.body).to include(user.email)
    end
  end

  describe "GET/edit" do
    before do
      sign_in user
      get edit_user_path(user.id)
    end

    example "editページが表示できること" do
      expect(response).to have_http_status(:success)
    end

    example "ユーザー情報編集画面が表示されること" do
      expect(response.body).to include("ユーザープロフィール編集")
    end
  end
end
