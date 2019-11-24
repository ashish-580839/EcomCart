FactoryBot.define do
  factory :item_discount1, class: ItemDiscount do
    discount_value { 15 }
    discount_unit { "flat_currency" }
    min_order_quantity { 3 }
  end

  factory :item_discount2, class: ItemDiscount do
    discount_value { 5 }
    discount_unit { "flat_currency" }
    min_order_quantity { 2 }
  end

  factory :item_discount3, class: ItemDiscount do
    discount_value { 10 }
    discount_unit { "percentage" }
    min_order_quantity { 2 }
    max_discount_amount { 100 }
  end

end
