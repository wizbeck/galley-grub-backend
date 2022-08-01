class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.float :price
      t.integer :item_type

      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
