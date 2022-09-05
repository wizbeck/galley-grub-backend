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

# Entree items ala carte
A_LA_CARTE = [
  'Krabby Patty',
  'Double Krabby Patty',
  'Triple Krabby Patty'
].freeze

SIDES = [
  'Coral Bits',
  'Kelp Rings'
].freeze

# Figure out what each combo meal should have in addition to the entree
COMBOS = [
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
