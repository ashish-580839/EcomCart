class CreateCartDiscounts < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_discounts do |t|

      t.integer :discount_value, null: false
      t.integer :discount_unit, null: false

      t.integer :min_cart_value
      t.decimal :max_discount_amount, precision: 8, scale: 2

      t.timestamps
    end
  end
end
