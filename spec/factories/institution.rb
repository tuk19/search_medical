FactoryBot.define do
  factory :testinstitution, class: "Institution" do
    name { "testinstitution" }
    postcode { 1234567 }
    prefecture { "東京都" }
    address_city { "東京区東京" }
    address_street { "1-2-3" }
    address_building { "東京ビル1F" }
    address { "東京都東京区東京1-2-3東京ビル1F" }
  end
end
