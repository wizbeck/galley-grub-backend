class Item < ApplicationRecord
  # Relationships
  has_many :item_toppings
  has_many :toppings, through: :item_toppings

  # Enum integers for item types
  enum item_type: { 'entree' => 1, 'side' => 2, 'drink' => 3 }

  # item_toppings are join table records associated already existing toppings to an item that can reused between items
  accepts_nested_attributes_for :item_toppings
  # Methods
end
