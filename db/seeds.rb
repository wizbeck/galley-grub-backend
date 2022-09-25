# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Destroy user created records
Order.destroy_all if Order.exists?
OrderItem.destroy_all if OrderItem.exists?
OrderItemTopping.destroy_all if OrderItemTopping.exists?

# Re seed the items and toppings
Item.destroy_all if Item.exists?
Topping.destroy_all if Topping.exists?
ItemTopping.destroy_all if ItemTopping.exists?

puts 'Existing records destroyed'

# Items
items = [
  { name: 'Krabby Patty', price: 1.25, item_type: 'entree' },
  { name: 'Double Krabby Patty', price: 2.00, item_type: 'entree' },
  { name: 'Triple Krabby Patty', price: 3.00, item_type: 'entree' },
  { name: 'Coral Bits', price: 1.00, item_type: 'side' },
  { name: 'Kelp Rings', price: 1.50, item_type: 'side' },
  { name: 'Kelp Shake', price: 2.00, item_type: 'drink' },
  { name: 'Seafoam Soda', price: 1.00, item_type: 'drink' },
  { name: 'Sailors Surprise', price: 3.00, item_type: 'entree' },
  { name: 'Footlong', price: 2.00, item_type: 'entree' },
  { name: 'Salty Sea Dog', price: 1.25, item_type: 'entree' },
  { name: 'Golden Loaf', price: 2.00, item_type: 'entree' }
]

# Create items
Item.create(items)

# Toppings
toppings = [
  { name: 'small' },
  { name: 'medium', price: 0.25 },
  { name: 'large', price: 0.50 },
  { name: 'sauce', price: 0.50 },
  { name: 'salty sauce', price: 0.50 },
  { name: 'sea cheese', price: 0.25 }
]

# Create toppings
Topping.create(toppings)

# Associate toppings to items via item_toppings
entree_toppings = Topping.where(name: ['sauce', 'salty sauce', 'sea cheese']).map { |t| { topping_id: t.id } }

# Associate toppings to entree items
entrees = Item.entree
entrees.each { |e| e.item_toppings.create(entree_toppings) }

# Associate toppings to sides and drinks
sides_drinks = Item.where(item_type: %w[side drink])
size_toppings = Topping.where(name: %w[small medium large]).map { |t| { topping_id: t.id } }
sides_drinks.each { |sd| sd.item_toppings.create(size_toppings) }

puts 'Starting records created!'
