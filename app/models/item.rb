class Item < ApplicationRecord
  # Relationships
  belongs_to :order

  # Enum integers for item types
  enum type: { entree: 1, side: 2, drink: 3 }

  # Scopes
  scope :entrees, -> { where(type: :entree) }
  scope :drinks, -> { where(type: :drink) }
  scope :sides, -> { where(type: :side) }
  # Methods
end
