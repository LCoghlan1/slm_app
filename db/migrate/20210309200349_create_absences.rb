class CreateAbsences < ActiveRecord::Migration[6.1]
  def change
    create_table :absences do |t|
      t.date :date
      t.float :full_pay
      t.float :half_pay
      t.text :description
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
