# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

item1 = Item.find_or_create_by(name: "A", unit_price: 30)
item2 = Item.find_or_create_by(name: "B", unit_price: 20)
item3 = Item.find_or_create_by(name: "C", unit_price: 50)
item4 = Item.find_or_create_by(name: "D", unit_price: 15)


ItemDiscount.find_or_create_by(item: item1, discount_value: 15, discount_unit: "flat_currency", min_order_quantity: 3)

ItemDiscount.find_or_create_by(item: item2, discount_value: 5, discount_unit: "flat_currency", min_order_quantity: 2)

CartDiscount.find_or_create_by(discount_value: 20, discount_unit: "flat_currency", min_cart_value: 150)
