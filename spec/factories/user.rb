FactoryBot.define do
  factory :testuser, class: 'User' do
    name { "testuser" }
    email { "testuser@user.com" }
    password { "foobar" }
  end
end
