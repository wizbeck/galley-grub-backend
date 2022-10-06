class OrderItemSerializer < BaseSerializer
  # See structure below for how we want the order to come out. i.e. individual order_item object listing its item_topppings that are joined
  attribute :order_id
  has_many :item_toppings
end
