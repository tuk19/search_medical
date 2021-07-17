class Medicalstaff < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :staff_institutions, dependent: :destroy
    has_many :institutions, through: :staff_institutions
end
