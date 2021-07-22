require 'rails_helper'

RSpec.describe "Medicalstaffs", type: :request do
  let(:medicalstaff) { create(:teststaff) }

  describe "GET /index" do
    before do
      sign_in medicalstaff
      get medicalstaffs_path
    end

    example "indexページが表示できること" do
      expect(response).to have_http_status(:success)
    end

    example "スタッフ情報が含まれること" do
      expect(response.body).to include(medicalstaff.email)
    end
  end

  describe "GET /edit" do
    before do
      sign_in medicalstaff
      get edit_medicalstaff_path(medicalstaff.id)
    end

    example "editページが表示できること" do
      expect(response).to have_http_status(:success)
    end

    example "スタッフ情報編集画面が表示されること" do
      expect(response.body).to include("登録情報編集")
    end
  end
end
