class RemoveForeignKeysFromItemsOrderIdToppingsItemId < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :order_id
    remove_index :items, column: :order_id, if_exists: true

    remove_column :toppings, :item_id
    remove_index :toppings, column: :item_id, if_exists: true
  end
end
