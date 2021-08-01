FactoryBot.define do
  factory :teststaff, class: 'Medicalstaff' do
    name { "teststaff" }
    sequence(:email) { |n| "teststaff#{n}@staff.com" }
    password { "foobarbaz" }

    trait :staff_institution do
      after(:create) do |medicalstaff|
        create(:teststaff_institution, medicalstaff: medicalstaff, institution: create(:tokyoinstitution) )
      end
    end
  end
end
