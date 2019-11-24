class CartDiscount < ApplicationRecord

  enum discount_unit: {
    "percentage" => 0,
    "flat_currency" => 1
  }
end
