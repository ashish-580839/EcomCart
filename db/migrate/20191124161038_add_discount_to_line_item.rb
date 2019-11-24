class AddDiscountToLineItem < ActiveRecord::Migration[5.2]
  def change

    add_column :line_items, :discount_amount, :decimal, precision: 8, scale: 2, default: 0
  end
end
