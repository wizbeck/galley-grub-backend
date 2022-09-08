class OrderItemTopping < ApplicationRecord
  # Relationships
  belongs_to :order_item
  belongs_to :item_topping
end
