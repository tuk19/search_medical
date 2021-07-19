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

    example "スタッフ情報編集画面が含まれること" do
      expect(response.body).to include("編集")
    end
  end

end
