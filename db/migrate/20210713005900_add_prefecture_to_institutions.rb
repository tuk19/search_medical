class AddPrefectureToInstitutions < ActiveRecord::Migration[6.1]
  def change
    add_column :institutions, :prefecture, :string
  end
end
