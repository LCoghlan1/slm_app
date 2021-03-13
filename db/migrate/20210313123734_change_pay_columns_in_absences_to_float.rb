class ChangePayColumnsInAbsencesToFloat < ActiveRecord::Migration[6.1]
  def change
    change_column :absences, :half_pay, :float
    change_column :absences, :full_pay, :float
  end
end
