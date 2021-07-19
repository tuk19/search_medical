require 'rails_helper'

RSpec.describe "Institutions", type: :request do
  let!(:institution) { create(:testinstitution) }

  describe "GET /index" do
    before do
      get institutions_path, params: { q: { name_const: "test"} }
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

  describe "GET /show" do
    before do
      get institution_path(institution.id)
    end

    example "医療機関情報が表示されること" do
      expect(response.body).to include(institution.name)
      expect(response.body).to include("編　集")
      expect(response.body).to include("削　除")
    end
  end
end
