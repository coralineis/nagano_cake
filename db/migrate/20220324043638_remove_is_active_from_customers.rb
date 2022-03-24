class RemoveIsActiveFromCustomers < ActiveRecord::Migration[6.1]
  def change
    remove_column :customers, :is_active, :boolean
  end
end
