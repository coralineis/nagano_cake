class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_detail = OrderDetail.find(params[:id])
    @total_payment = 0
    @shipping_cost = 800
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      @order.order_detail.update_all(making_status: 1) if @order.status == 1
      redirect_to admin_order_path(@order.id)
    else
    redirect_to admin_order_path(@order.id)
    end
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

end
