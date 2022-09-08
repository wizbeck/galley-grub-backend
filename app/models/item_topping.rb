class ItemTopping < ApplicationRecord
  # This is a join table which will hold the ids of a corresponding item, and a topping id
  # and will be used to determine the available toppings for a particular item.

  # Relationships
  belongs_to :item
  belongs_to :topping
end
