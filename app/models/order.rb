class Order < ApplicationRecord
  # Relationships
  has_many :order_items, dependent: :destroy
  has_many :order_item_toppings, through: :order_items

  # Nested Attributes
  accepts_nested_attributes_for :order_items

  # Scopes
  scope :best_customers, -> { order(total: :desc).limit(5) }

  # Methods
end
