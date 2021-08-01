class AddDepartmentToInstitution < ActiveRecord::Migration[6.1]
  def change
    add_column :institutions, :department, :string
  end
end
