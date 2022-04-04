class Public::CartItemsController < ApplicationController
  def create
    @item = Item.find(cart_item_params[:item_id])
    @item.save
    redirect_to cart_items_path
  end

  def index
    @cart_items = current_customer.cart_items
    @total_payment
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
