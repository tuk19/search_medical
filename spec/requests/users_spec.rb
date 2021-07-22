require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { create(:testuser) }

  describe "GET /index" do
    context "ログインしていない場合" do
      example "ログインページへリダイレクトすること" do
        get users_path
        expect(response).to redirect_to user_session_path
      end
    end

    context "ログインしている場合" do
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

  describe 'PUT /update' do
    before do
      sign_in user
    end

    example 'リクエストが成功すること' do
      put user_path(user.id), params: { user: { name: "exampleuser", image: "image.png" } }
      expect(response.status).to eq 302
    end

    example 'ユーザー名が更新されること' do
      expect do
        put user_path(user.id), params: { user: { name: "exampleuser", image: "image.png" } }
      end.to change { User.find(user.id).name }.from('testuser').to('exampleuser')
    end
  end
end
