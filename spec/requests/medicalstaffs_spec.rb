require 'rails_helper'

RSpec.describe "Medicalstaffs", type: :request do
  let(:medicalstaff) { create(:teststaff) }

  describe "GET /index" do
    context "ログインしていない場合" do
      example "ログインページへリダイレクトすること" do
        get medicalstaffs_path
        expect(response).to redirect_to medicalstaff_session_path
      end
    end

    context "ログインしている場合" do
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

  describe 'PUT /create' do
    before do
      sign_in medicalstaff
    end

    example 'リクエストが成功すること' do
      put medicalstaff_path(medicalstaff.id), params: { medicalstaff: { name: "examplestaff", address: "exampleaddress" } }
      expect(response.status).to eq 302
    end

    example 'ユーザー名が更新されること' do
      expect do
        put medicalstaff_path(medicalstaff.id), params: { medicalstaff: { name: "examplestaff", address: "exampleaddress" } }
      end.to change { Medicalstaff.find(medicalstaff.id).name }.from('teststaff').to('examplestaff')
    end
  end
end
