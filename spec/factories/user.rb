FactoryBot.define do
  factory :testuser, class: 'User' do
    name { "testuser" }
    sequence(:email) { |n| "testuser#{n}@user.com" }
    password { "foobar" }
  end
end
