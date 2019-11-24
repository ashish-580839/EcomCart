require 'rails_helper'

RSpec.describe Cart, type: :model do

  before(:all) do
    @itemA = create(:itemA)
    @itemB = create(:itemB)
    @itemC = create(:itemC)
    @itemD = create(:itemD)

    @item_discount1 = create(:item_discount1, item: @itemA)
    @item_discount2 = create(:item_discount2, item: @itemB)
    @item_discount3 = create(:item_discount3, item: @itemC)

    @cart_discount = create(:cart_discount)
  end

  before(:each) do
    @cart = create(:cart)
  end

  describe 'cart_total' do

    it 'should add an item to cart' do
      @cart.add_item(@itemA).save
      expect(@cart.line_items.size).to eq(1)
    end

    it 'should not allow duplicate item in cart' do
      @cart.add_item(@itemA).save
      @cart.add_item(@itemA).save

      expect(@cart.line_items.size).to eq(1)
      expect(@cart.line_items[0].quantity).to eq(2)
    end

    it 'should return 0 as grand total if cart is empty' do
      expect(@cart.grand_total).to eq(BigDecimal(0))
    end

    it 'should return correct amount as grand total if cart has one item' do
      @cart.add_item(@itemA)
      expect(@cart.grand_total).to eq(@itemA.unit_price)
    end

    it 'should return correct amount as grand total if cart has two unique item' do
      @cart.add_item(@itemA)
      @cart.add_item(@itemB)
      grand_total = @itemA.unit_price + @itemB.unit_price

      expect(@cart.grand_total).to eq(grand_total)
    end

    it 'should return correct amount as grand total if cart has four unique item' do
      @cart.add_item(@itemA)
      @cart.add_item(@itemB)
      @cart.add_item(@itemC)
      @cart.add_item(@itemD)

      expect(@cart.grand_total).to eq(115)
    end


    it 'should return discounted amount as grand total if 3 of Item A (flat currency discount) are added to cart' do
      @cart.add_item(@itemA, 3)
      CartDiscountor.new(@cart).apply

      expect(@cart.grand_total).to eq(75)
    end

    it 'should return discounted amount as grand total if 3 of Item A and 2 of Item B (flat currency discount) are added to cart' do
      @cart.add_item(@itemA, 3)
      @cart.add_item(@itemB, 2)
      CartDiscountor.new(@cart).apply

      expect(@cart.grand_total).to eq(110)
    end

    it 'should return discounted amount as grand total if 4 of Item C (percentage discount) are added to cart' do
      @cart.add_item(@itemC, 2)
      CartDiscountor.new(@cart).apply

      expect(@cart.grand_total).to eq(90)
    end

    it 'should return discounted amount as grand total if cart price is eligible for additional discount' do
      @cart.add_item(@itemA, 3) # 75
      @cart.add_item(@itemB, 2) # 35
      @cart.add_item(@itemC) # 50
      @cart.add_item(@itemD) # 15
      CartDiscountor.new(@cart).apply # -20 (cart discount)

      expect(@cart.grand_total).to eq(155)
    end

    it 'should return discounted amount as grand total if 6 of Item A, 3 of Item B and 4 of Item C are added to cart' do
      @cart.add_item(@itemA, 6) # 150
      @cart.add_item(@itemB, 3) # 55
      @cart.add_item(@itemC, 4) # 180
      CartDiscountor.new(@cart).apply # -20 (cart discount)

      expect(@cart.grand_total).to eq(365)
    end

    it 'should return discounted amount as grand total if 30 of Item C are added to cart and max discount is capped on Item C' do
      @cart.add_item(@itemC, 30)
      CartDiscountor.new(@cart).apply

      expect(@cart.grand_total).to eq(1380)
    end

  end
end
