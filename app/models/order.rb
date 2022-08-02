class Order < ApplicationRecord
  # Relationships
  has_many :items

  # Scopes
  scope :best_customers, -> { order(total: :desc).limit(5) }

  # Methods
end
