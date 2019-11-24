FactoryBot.define do
  factory :cart_discount do
    discount_value { 20 }
    discount_unit  { "flat_currency"}
    min_cart_value { 150 }
  end
end
