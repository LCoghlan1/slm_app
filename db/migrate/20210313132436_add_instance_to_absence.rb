class AddInstanceToAbsence < ActiveRecord::Migration[6.1]
  def change
    add_column :absences, :instance_no, :integer
  end
end
