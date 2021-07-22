FactoryBot.define do
  factory :teststaff_institution, class: "StaffInstitution" do
    medicalstaff { create(:teststaff) }
    institution { create(:institution) }
  end
end
