# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# This seed file needs to do the following:
#   1. Create items that match with the Krusty Krab Galley Grub menu
#   2. Create realistic toppings that coincide with certain menu_items, set category
#     - check the relationship with category of an item, vs the category type on a topping.
#     - We might need to create a category object, which holds the name and some sort of id/integer to distinguish 
#       the category
#

# Destroy user related records
Order.destroy_all if Order.exists?
OrderItem.destroy_all if OrderItem.exists?
OrderItemTopping.destroy_all if OrderItemTopping.exists?

# Re seed the items and toppings
Item.destroy_all if Item.exists?
Topping.destroy_all if Topping.exists?
ItemTopping.destroy_all if ItemTopping.exists?

# Build the items and toppings
# we can clone a order item, with certain toppings, and additional items as a combo

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

# Create Items
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

# Create Toppings
Topping.create(toppings)

# Associate toppings to items via item_toppings
entree_toppings = Topping.where(name: ['sauce', 'salty sauce', 'sea cheese']).map { |t| { topping_id: t.id } }

# Associate toppings to  entree items
entrees = Item.entree
entrees.each { |e| e.item_toppings.create(entree_toppings) }

# Associate toppings to sides and drinks

sides_drinks = Item.where(item_type: %w[side drink])
size_toppings = Topping.where(name: %w[small medium large]).map { |t| { topping_id: t.id } }
sides_drinks.each { |sd| sd.item_toppings.create(size_toppings) }


# TODO: Figure out how to build combos into a method of creating OrderItem, with OrderItem Toppings.
  # Maybe send messages or api requests to return the specific orderitems with toppings prebuilt

COMBO_MESSAGES = [
  'Krabby Meal',
  'Double Krabby Meal',
  'Triple Krabby Meal',
  'Salty Sea Dog',
  'Footlong',
  'Sailors Surprise',
  'Golden Loaf'
]


