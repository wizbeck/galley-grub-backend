class OrderItemToppingSerializer < BaseSerializer
  # expose order_item_topping attributes?
  belongs_to :item_topping
end
