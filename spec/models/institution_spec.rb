require 'rails_helper'

RSpec.describe Institution, type: :model do
  describe '#join_address' do
    let(:institution) { create(:testinstitution) }

    example "addressを返すこと" do
      expect(institution.join_address).to eq(institution.address)
    end
  end
end
