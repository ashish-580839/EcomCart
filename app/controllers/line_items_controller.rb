class LineItemsController < ApplicationController


  include CurrentCart

  before_action :set_cart, only: [:create]

  before_action :set_line_item, only: [:update, :destroy]

  def create
    item = Item.find(params[:line_item][:item_id])
    @line_item = @cart.add_item(item)

    if @line_item.save
      render json: @line_item, status: :ok
    else
      render json: {errors: @line_item.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    if @line_item.destroy
      render json: @line_item, status: :ok
    else
      render json: {errors: ["Some error occured while deleting item: #{@line_item.item_name} from cart "] }, status: :unprocessable_entity
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def line_item_params
    params.permit(line_item: [:item_id])
  end
end
