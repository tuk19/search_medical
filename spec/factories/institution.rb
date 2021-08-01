FactoryBot.define do
  factory :tokyoinstitution, class: "Institution" do
    name { "tokyoinstitution" }
    department { "内科" }
    postcode { 1234567 }
    prefecture { "東京都" }
    address_city { "東京区東京" }
    address_street { "1-2-3" }
    address_building { "東京ビル1F" }
    address { "東京都東京区東京1-2-3東京ビル1F" }
    introduction { "東京駅近く" }
  end

  factory :fukuokainstitution, class: "Institution" do
    name { "fukuokainstitution" }
    department { '整形外科、リハビリテーション科' }
    postcode { 1011120 }
    prefecture { "福岡県" }
    address_city { "福岡市福岡区福岡" }
    address_street { "2-9-0" }
    address_building { "福岡ハイツ1F" }
    address { "福岡県福岡市福岡区福岡2-9-0福岡ハイツ1F" }
    introduction { "バリアフリー" }
  end
end
