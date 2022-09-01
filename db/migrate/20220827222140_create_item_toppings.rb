class CreateItemToppings < ActiveRecord::Migration[6.1]
  def change
    create_table :item_toppings do |t|
      t.references :item
      t.references :topping
      t.timestamps
    end
  end
end
