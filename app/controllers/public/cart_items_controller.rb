class Public::CartItemsController < ApplicationController
  def create
    @item = CartItem.new(cart_item_params)
    @item.save
    redirect_to cart_items_path
  end

  def index
    @items = CartItem.all
  end

  def update
  end

  def destroy
  end

  def destroy_all
    @item = CartItem.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
