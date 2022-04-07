class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.all
  end

  def update
    @order = Order.find(params[:id])
    @order.update
    redirect_to admin_order_path(@order.id)
  end
end
