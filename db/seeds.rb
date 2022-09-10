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
OrderItemTopping.destroy_all if OrderItemToping.exists?

# Re seed the items and toppings
Item.destroy_all if Item.exists?
Topping.destroy_all if Topping.exists?
ItemTopping.destroy_all if ItemTopping.exists?

# Build the items and toppings
# we can clone a order item, with certain toppings, and additional items as a combo

# Create Entrees
items = [
  { name: 'Krabby Patty', price: 1.25, item_type: 'entree' },
  { name: 'Double Krabby Patty', price: 2.00, item_type: 'entree' },
  { name: 'Triple Krabby Patty', price: 3.00, item_type: 'entree' },
  { name: 'Coral Bits', item_type: 'side' }, # sides default to 0. small, medium, large toppings are prices
  { name: 'Kelp Rings', price: 1.50, item_type: 'side' },
  { name: 'Kelp Shake', price: 2.00, item_type: 'drink' },
  { name: 'Seafoam Soda', item_type: 'drink' } # Drink item, with small, med, large toppings
]

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

DRINKS = [
  'Kelp Shake',
  'Seafoam Soda'
]

# Basic Item creation w/ attributes

# Item Attributes:
# create_table "items", force: :cascade do |t|
# string "name"
# decimal "price", precision: 8, scale: 2, default: 0.0
# integer "item_type"

# Item.create(items)

Topping.create(
  name: 'Sea Cheese',
  price: 0.25
)
