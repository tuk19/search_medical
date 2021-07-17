class CreateStaffInstitutions < ActiveRecord::Migration[6.1]
  def change
    create_table :staff_institutions do |t|
      t.references :medicalstaff, null: false, foreign_key: true
      t.references :institution, null: false, foreign_key: true

      t.timestamps
      t.index [:medicalstaff_id, :institution_id], unique: true
    end
  end
end
