class CartDiscountor
  attr_accessor :cart

  def initialize(cart)
    @cart = cart
  end

  def apply
    set_discount_to_line_items
    set_cart_discount
  end

  private

  def set_discount_to_line_items
    line_items = cart.line_items
    item_discounts = ItemDiscount.where(item_id: line_items.map(&:item_id) ).
    order("item_id asc, min_order_quantity desc").to_a

    line_items.each do |line_item|
      rule = item_discounts.select do |item_discount|
        item_discount.item_id==line_item.item_id && line_item.quantity>=item_discount.min_order_quantity
      end.first
      return if rule.nil?
      if rule.discount_unit=="percentage"
        discount_amount = ( line_item.total_amount * rule.discount_value ) / 100
      elsif rule.discount_unit=="flat_currency"
        discount_amount = (line_item.quantity / rule.min_order_quantity) * rule.discount_value
      end
      line_item.discount_amount = discount_amount.round
      line_item.discount_amount = [line_item.discount_amount, rule.max_discount_amount ].min if rule.max_discount_amount.present?
    end
  end

  def set_cart_discount
    rule = CartDiscount.where("min_cart_value <= ? ", cart.total_amount).order("min_cart_value desc").first
    return if rule.nil?
    if rule.discount_unit=="percentage"
      discount_amount = (  cart.total_amount * rule.discount_value ) / 100
    elsif rule.discount_unit=="flat_currency"
      discount_amount = rule.discount_value
    end
    cart.discount_amount = discount_amount.round
    cart.discount_amount = [cart.discount_amount, rule.max_discount_amount ].min if rule.max_discount_amount.present?
  end
end
