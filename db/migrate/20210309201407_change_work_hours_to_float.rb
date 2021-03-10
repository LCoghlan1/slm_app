class ChangeWorkHoursToFloat < ActiveRecord::Migration[6.1]
  def change
    change_column :employees, :workHours, :float
  end
end
