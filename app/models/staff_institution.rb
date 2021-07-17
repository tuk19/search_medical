class StaffInstitution < ApplicationRecord
  belongs_to :medicalstaff
  belongs_to :institution
end
