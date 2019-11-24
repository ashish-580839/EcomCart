class CartsController < ApplicationController

  before_action :set_cart, only: [:show]

  def show
    render json: @cart, status: :ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cart
    render json: {cart: nil} and return if session[:cart_id].nil? 
    @cart = Cart.find(session[:cart_id])
  end


end
