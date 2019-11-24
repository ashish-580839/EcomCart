class LineItemSerializer < ActiveModel::Serializer
  attributes :id, :item_id, :quantity, :item_name, :unit_amount, :net_amount



end
