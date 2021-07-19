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

end
