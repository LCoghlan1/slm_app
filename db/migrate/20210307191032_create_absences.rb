class CreateAbsences < ActiveRecord::Migration[6.1]
  def change
    create_table :absences do |t|
      t.date :start_date
      t.date :end_date
      t.float :num_days
      t.text :description

      t.timestamps
    end
  end
end
