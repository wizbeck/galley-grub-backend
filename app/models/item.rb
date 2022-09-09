class Item < ApplicationRecord
  # Relationships
  belongs_to :order
  has_many :item_toppings

  # Enum integers for item types
  enum item_type: { 'entree' => 1, 'side' => 2, 'drink' => 3 }

  # Scopes
  scope :entrees, -> { where(type: :entree) }
  scope :drinks, -> { where(type: :drink) }
  scope :sides, -> { where(type: :side) }

  # item_toppings are join table records associated already existing toppings to an item that can be reused between items
  accepts_nested_attributes_for :item_toppings
  # Methods
end
