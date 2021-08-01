class Institution < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :staff_institutions, dependent: :destroy
  has_many :medicalstaffs, through: :staff_institutions
  has_many :consultationhours, dependent: :destroy
  mount_uploader :image, ImageUploader

  def join_address
    "#{prefecture}#{address_city}#{address_street}#{address_building}"
  end
end
