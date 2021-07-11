class AddImageToInstitutions < ActiveRecord::Migration[6.1]
  def change
    add_column :institutions, :image, :string
  end
end
