class CreateOrderItemToppings < ActiveRecord::Migration[6.1]
  def change
    create_table :order_item_toppings do |t|
      t.references :item_topping
      t.references :order_item
      t.timestamps
    end
  end
end
