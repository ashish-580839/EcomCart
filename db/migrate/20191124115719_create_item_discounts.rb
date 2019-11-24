class CreateItemDiscounts < ActiveRecord::Migration[5.2]
  def change
    create_table :item_discounts do |t|
      t.references :item, null: false

      t.integer :discount_value, null: false
      t.integer :discount_unit, null: false

      t.integer :min_order_quantity
      t.decimal :max_discount_amount, precision: 8, scale: 2

      t.timestamps
    end
  end
end
