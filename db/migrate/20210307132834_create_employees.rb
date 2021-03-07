class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :firstName
      t.string :lastName
      t.string :location
      t.integer :workHours

      t.timestamps
    end
  end
end
