class AddAddressToInstitutions < ActiveRecord::Migration[6.1]
  def change
    add_column :institutions, :postcode, :integer
    add_column :institutions, :prefecture_code, :integer
    add_column :institutions, :address_city, :string
    add_column :institutions, :address_street, :string
    add_column :institutions, :address_building, :string
  end
end
