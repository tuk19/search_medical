class AddDetailsToMedicalstaffs < ActiveRecord::Migration[6.1]
  def change
    add_column :medicalstaffs, :name, :string
    add_column :medicalstaffs, :address, :string
  end
end
