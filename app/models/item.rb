class Item < ApplicationRecord


  validates :name, presence: true

  validates :unit_price, presence: true

  validates :name, length: { minimum: 1, maximum: 200 }, allow_blank: true

  validates :unit_price, numericality: {greater_than: 0}, allow_nil: true

  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  private

  # ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Line Items present with this item.')
      throw :abort
    end
  end

end
