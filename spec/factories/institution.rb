FactoryBot.define do
  factory :tokyoinstitution, class: "Institution" do
    name { "tokyoinstitution" }
    postcode { 1234567 }
    prefecture { "東京都" }
    address_city { "東京区東京" }
    address_street { "1-2-3" }
    address_building { "東京ビル1F" }
    address { "東京都東京区東京1-2-3東京ビル1F" }
  end

  factory :osakainstitution, class: "Institution" do
    name { "osakainstitution" }
    department { '整形外科、リハビリテーション科' }
    postcode { 9876543 }
    prefecture { "大阪府" }
    address_city { "大阪市中央区大阪下町" }
    address_street { "9−9−9" }
    address_building { "大阪ハイツ1F" }
    address { "大阪府大阪市中央区大阪下町9−9−9大阪ハイツ1F" }
  end
end
