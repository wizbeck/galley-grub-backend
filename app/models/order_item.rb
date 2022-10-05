class OrderItem < ApplicationRecord
  # Relationships
  belongs_to :order
  belongs_to :item
  has_many :order_item_toppings, dependent: :destroy
  has_many :item_toppings, through: :order_item_toppings
  has_many :toppings, through: :item_toppings

  # Nested attributes
  accepts_nested_attributes_for :order_item_toppings
end
