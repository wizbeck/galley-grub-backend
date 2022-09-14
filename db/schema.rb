# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_09_14_023250) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "item_toppings", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "topping_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_item_toppings_on_item_id"
    t.index ["topping_id"], name: "index_item_toppings_on_topping_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.decimal "price", precision: 8, scale: 2, default: "0.0"
    t.integer "item_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "order_item_toppings", force: :cascade do |t|
    t.bigint "item_topping_id"
    t.bigint "order_item_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_topping_id"], name: "index_order_item_toppings_on_item_topping_id"
    t.index ["order_item_id"], name: "index_order_item_toppings_on_order_item_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "item_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_order_items_on_item_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.decimal "total", precision: 8, scale: 2, default: "0.0"
    t.string "cust_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "completed", default: false
    t.index ["total"], name: "index_orders_on_total"
  end

  create_table "toppings", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "price", precision: 8, scale: 2, default: "0.0", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
