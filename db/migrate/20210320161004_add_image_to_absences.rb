class AddImageToAbsences < ActiveRecord::Migration[6.1]
  def change
    add_column :absences, :image, :string
  end
end
