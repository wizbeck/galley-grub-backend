class CreateToppings < ActiveRecord::Migration[6.1]
  def change
    create_table :toppings do |t|
      t.string :name, null: false
      t.float :price, default: 0.0, null: false
      t.belongs_to :item

      t.timestamps
    end
  end
end
