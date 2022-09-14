class AddStatusToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :completed, :bool, default: false
  end
end
