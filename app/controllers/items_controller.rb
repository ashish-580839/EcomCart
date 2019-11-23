class ItemsController < ApplicationController


  def index
    @items = Item.all
    if @items.length==0
      render json: {items: []}, status: :ok
    else
      render json: @items, status: :ok
    end
  end

  

end
