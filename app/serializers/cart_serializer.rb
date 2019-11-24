class CartSerializer < ActiveModel::Serializer
  attributes :id, :total_amount, :discount_amount, :grand_total

  has_many :line_items
end
