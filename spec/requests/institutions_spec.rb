require 'rails_helper'

RSpec.describe "Institutions", type: :request do
  let!(:institution) { create(:testinstitution) }
  let(:param) do
    {
      institution: {
        name: 'examplehospital',
        postcode: 9876543,
        prefecture: "福岡県",
        address_city: "福岡市福岡",
        address_street: "4-5-6",
        address_building: "福岡ショッピング5F",
        address: "福岡県福岡市福岡4-5-6福岡ショッピング5F",
        introduction: "整形外科、リハビリテーション科",
        image: "examplehospital.png"
      }
    }
  end

  describe "GET /index" do
    before do
      get institutions_path
    end

    example "ページを表示できること" do
      expect(response).to have_http_status(:success)
    end

    example "医療機関情報が含まれること" do
      expect(response.body).to include(institution.name)
      expect(response.body).to include(institution.address)
    end
  end

  describe "GET /new" do
    before do
      get new_institution_path
    end

    example "新規作成画面が表示されること" do
      expect(response.body).to include("医療機関情報新規作成")
    end
  end

  describe 'POST /create' do
    example 'リクエストが成功すること' do
      post institutions_path, params: param
      expect(response.status).to eq 302
    end

    example '医療機関が登録されること' do
      expect do
        post institutions_path, params: param
      end.to change(Institution, :count).by(1)
    end
  end

  describe "GET /show" do
    let!(:consultationhour) { create(:testconsultationhour, institution: institution)}

    before do
      get institution_path(institution.id)
    end

    example "医療機関情報が表示されること" do
      expect(response.body).to include(institution.name)
      expect(response.body).to include(institution.address)
    end

    example "診療時間が表示されること" do
      expect(response.body).to include("診療時間")
      expect(response.body).to include("●")
      expect(response.body).to include("-")
      expect(response.body).to include("※")
      expect(response.body).to include("土曜日は13:00まで")
    end
  end

  describe "GET/edit" do
    before do
      get edit_institution_path(institution.id)
    end

    example "editページが表示できること" do
      expect(response).to have_http_status(:success)
    end

    example "医療機関情報編集画面が表示されること" do
      expect(response.body).to include("医療機関情報修正")
    end
  end

  describe 'PUT /update' do
    example 'リクエストが成功すること' do
      put institution_path(institution.id), params: param
      expect(response.status).to eq 302
    end

    example '医療機関情報が更新されること' do
      expect do
        put institution_path(institution.id), params: param
      end.to change { Institution.find(institution.id).name }.from('testinstitution').to('examplehospital')
    end
  end

  describe 'DELETE /destroy' do
    it 'リクエストが成功すること' do
      delete institution_path(institution.id), params: { id: institution.id }
      expect(response.status).to eq 302
    end

    it '医療機関情報が削除されること' do
      expect do
        delete institution_path(institution.id), params: { id: institution.id }
      end.to change(Institution, :count).by(-1)
    end

    it '医療機関一覧にリダイレクトすること' do
      delete institution_path(institution.id), params: { id: institution.id }
      expect(response).to redirect_to(institutions_path)
    end
  end

  describe 'GET /consultationhour' do
    before do
      get consultationhour_institution_path(institution.id)
    end

    example "editページが表示できること" do
      expect(response).to have_http_status(:success)
    end

    example "医療機関情報編集画面が表示されること" do
      expect(response.body).to include("診療時間作成")
    end
  end
end
