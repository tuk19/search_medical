class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :institution, null: false, foreign_key: true

      t.timestamps
      t.index [:user_id, :institution_id], unique: true
    end
  end
end
