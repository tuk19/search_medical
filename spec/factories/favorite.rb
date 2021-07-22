FactoryBot.define do
  factory :testfavorite, class: "Favorite" do
    user { create(:testuser) }
    institution { create(:institution) }
  end
end
