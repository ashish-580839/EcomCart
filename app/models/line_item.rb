class LineItem < ApplicationRecord

  belongs_to :item
  belongs_to :cart


  def net_amount
    unit_amount * quantity
  end
  
end
