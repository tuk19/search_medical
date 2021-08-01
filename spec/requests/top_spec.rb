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

    example "使用法の説明が含まれること" do
      expect(response.body).to include("お気に入り機能")
      expect(response.body).to include("医療機関情報検索機能")
      expect(response.body).not_to include("所属登録")
      expect(response.body).not_to include("周辺情報表示機能")
    end
  end

  describe "GET /medicalstaff_info" do

    before do
      get top_medicalstaff_info_path
    end

    example "医療関係者の使用法説明ページへアクセスできること"  do
      expect(response).to have_http_status(:success)
    end

    example "使用法の説明が含まれること" do
      expect(response.body).to include("所属登録")
      expect(response.body).to include("周辺情報表示機能")
    end
  end
end
