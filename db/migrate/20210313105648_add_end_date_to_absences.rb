class AddEndDateToAbsences < ActiveRecord::Migration[6.1]
  def change
    add_column :absences, :end_date, :date
  end
end
