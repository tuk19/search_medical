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

  describe "GET /user_info" do

    before do
      get top_user_info_path
    end

    example "ユーザーの使用法説明ページへアクセスできること"  do
      expect(response).to have_http_status(:success)
    end

    example "ログイン機能が含まれること" do
      expect(response.body).to include("お気に入りに登録すると、プロフィール画面にお気に入り一覧が表示されます。")
    end
  end

  describe "GET /medicalstaff_info" do

    before do
      get top_medicalstaff_info_path
    end

    example "医療関係者の使用法説明ページへアクセスできること"  do
      expect(response).to have_http_status(:success)
    end

    example "ログイン機能が含まれること" do
      expect(response.body).to include("所属登録をすると、登録情報画面に一覧が表示されます。")
    end
  end
end
