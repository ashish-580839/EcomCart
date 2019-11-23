# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.find_or_create_by(name: "A", unit_price: 30)
Item.find_or_create_by(name: "B", unit_price: 20)
Item.find_or_create_by(name: "C", unit_price: 50)
Item.find_or_create_by(name: "D", unit_price: 15)
