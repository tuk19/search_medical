class AddDetailToConsultationhour < ActiveRecord::Migration[6.1]
  def change
    add_column :consultationhours, :institution_id, :integer
    add_column :consultationhours, :detail, :string
  end
end
