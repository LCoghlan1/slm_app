class ChangeEntitlementToFloat < ActiveRecord::Migration[6.1]
  def change
    change_column :employees, :entitlement, :float
  end
end
