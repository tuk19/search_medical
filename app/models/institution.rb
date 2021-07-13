class Institution < ApplicationRecord
  mount_uploader :image, ImageUploader

  def join_address
    "#{self.prefecture}#{self.address_city}#{self.address_street}#{self.address_building}"
  end
end
