FactoryBot.define do

  factory :itemA, class: Item do
    name  {"A"}
    unit_price {30}
  end

  factory :itemB, class: Item do
    name  {"B"}
    unit_price {20}
  end

  factory :itemC, class: Item do
    name  {"C"}
    unit_price {50}
  end

  factory :itemD, class: Item do
    name  {"D"}
    unit_price {15}
  end
end
