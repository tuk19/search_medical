class CreateConsultationhours < ActiveRecord::Migration[6.1]
  def change
    create_table :consultationhours do |t|
      t.time :start_time
      t.time :end_time
      t.string :monday
      t.string :tuesday
      t.string :wednesday
      t.string :thursday
      t.string :friday
      t.string :saturday
      t.string :sunday
      t.string :holiday

      t.timestamps
    end
  end
end
