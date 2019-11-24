class LineItemSerializer < ActiveModel::Serializer
  attributes :id, :item_id, :quantity, :item_name, :unit_amount, :discount_amount, :net_amount



end
