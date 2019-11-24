class AddDiscountToCart < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :discount_amount, :decimal, precision: 8, scale: 2, default: 0
  end
end
