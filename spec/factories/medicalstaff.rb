FactoryBot.define do
  factory :teststaff, class: 'Medicalstaff' do
    name { "teststaff" }
    email { "teststaff@staff.com" }
    password { "foobarbaz" }
  end
end
