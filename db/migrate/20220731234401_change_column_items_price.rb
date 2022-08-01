class ChangeColumnItemsPrice < ActiveRecord::Migration[6.1]
  def up
    change_column :items, :price, :decimal, precision: 8, scale: 2, default: 0.00
  end

  def down
    change_column :items, :price, :float, default: 0.0, null: false
  end
end
