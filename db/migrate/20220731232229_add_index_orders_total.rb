class AddIndexOrdersTotal < ActiveRecord::Migration[6.1]
  def change
    add_index(:orders, :total)
  end
end
