class Cart < ApplicationRecord

  has_many :line_items, -> {order(:created_at) }, dependent: :destroy

  def add_item(item)
    current_item = line_items.find_by(item_id: item.id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(item_id: item.id, unit_amount: item.unit_price, item_name: item.name)
    end
    current_item
  end

  def total_amount
    @total_amount ||= line_items.to_a.sum { |item| item.net_amount }
  end

  def grand_total
    total_amount - discount_amount
  end

end
