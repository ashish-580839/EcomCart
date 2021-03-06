# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_24_171320) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cart_discounts", force: :cascade do |t|
    t.integer "discount_value", null: false
    t.integer "discount_unit", null: false
    t.integer "min_cart_value"
    t.decimal "max_discount_amount", precision: 8, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "discount_amount", precision: 8, scale: 2, default: "0.0"
  end

  create_table "item_discounts", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.integer "discount_value", null: false
    t.integer "discount_unit", null: false
    t.integer "min_order_quantity"
    t.decimal "max_discount_amount", precision: 8, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_discounts_on_item_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "unit_price", precision: 8, scale: 2, null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "line_items", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "cart_id", null: false
    t.integer "quantity", default: 1
    t.decimal "unit_amount", precision: 8, scale: 2, null: false
    t.string "item_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "discount_amount", precision: 8, scale: 2, default: "0.0"
    t.index ["cart_id"], name: "index_line_items_on_cart_id"
    t.index ["item_id"], name: "index_line_items_on_item_id"
  end

end
