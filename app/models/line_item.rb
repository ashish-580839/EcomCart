class LineItem < ApplicationRecord

  belongs_to :item
  belongs_to :cart

  validates :quantity, presence: true

  validates :quantity, numericality: {greater_than: 0}, allow_nil: true

  def total_amount
    unit_amount * quantity
  end

  def net_amount
    total_amount - discount_amount
  end



end
