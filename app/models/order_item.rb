class OrderItem < ApplicationRecord
  # Relationships
  belongs_to :order
  belongs_to :item
  has_many :order_item_toppings, dependent: :destroy

  accepts_nested_attributes_for :order_item_toppings
end
