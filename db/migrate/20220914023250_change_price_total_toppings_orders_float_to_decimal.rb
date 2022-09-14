class ChangePriceTotalToppingsOrdersFloatToDecimal < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :total, :decimal, precision: 8, scale: 2, default: 0.00
    change_column :toppings, :price, :decimal, precision: 8, scale: 2, default: 0.00
  end
end
