class Public::CartItemsController < ApplicationController
  def create
    @item = Item.new(cart_item_params)
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
