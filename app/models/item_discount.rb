class ItemDiscount < ApplicationRecord

  belongs_to :item

  enum discount_unit: {
    "percentage" => 0,
    "flat_currency" => 1
  }

end
