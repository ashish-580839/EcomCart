class Item < ApplicationRecord


  validates :name, presence: true

  validates :unit_price, presence: true

  validates :name, length: { minimum: 1, maximum: 200 }, allow_blank: true

  validates :unit_price, numericality: {greater_than: 0}, allow_nil: true

end
