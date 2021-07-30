require 'rails_helper'

RSpec.describe "Consultationhours", type: :request do
  let(:institution) { create(:testinstitution) }
  let!(:consultationhour) { create(:testconsultationhour, institution: institution) }


  describe 'POST /create' do
    example 'リクエストが成功すること' do
      post consultationhours_path, params: { consultationhour: FactoryBot.attributes_for(:editconsultationhour) }
      expect(response.status).to eq 302
    end

    example '医療機関が登録されること' do
      expect do
        post consultationhours_path, params: { consultationhour: FactoryBot.attributes_for(:editconsultationhour) }
      end.to change(Consultationhour, :count).by(1)
    end
  end

  describe "GET /edit" do
    before do
      get edit_consultationhour_path(consultationhour.id)
    end

    example "editページが表示できること" do
      expect(response).to have_http_status(:success)
    end

    example "診療時間編集画面が表示されること" do
      expect(response.body).to include("診療時間編集")
    end
  end

  describe 'PUT /update' do
    example 'リクエストが成功すること' do
      put consultationhour_path(consultationhour.id), params: { consultationhour: FactoryBot.attributes_for(:editconsultationhour) }
      expect(response.status).to eq 302
    end

    example '医療機関情報が更新されること' do
      expect do
        put consultationhour_path(consultationhour.id), params: { consultationhour: FactoryBot.attributes_for(:editconsultationhour) }
      end.to change { Consultationhour.find(consultationhour.id).detail }.from('土曜日は13:00まで').to('※は12:30まで')
    end
  end

  describe 'DELETE /destroy' do
    it 'リクエストが成功すること' do
      delete consultationhour_path(consultationhour.id), params: { id: consultationhour.id }
      expect(response.status).to eq 302
    end

    it '医療機関情報が削除されること' do
      expect do
        delete consultationhour_path(consultationhour.id), params: { id: consultationhour.id }
      end.to change(Consultationhour, :count).by(-1)
    end

    it '医療機関一覧にリダイレクトすること' do
      delete consultationhour_path(consultationhour.id), params: { id: consultationhour.id }
      expect(response).to redirect_to(institutions_path)
    end
  end
end
