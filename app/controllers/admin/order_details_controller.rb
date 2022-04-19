class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    if @order_detail.update(order_detail_params)
      if @order_detail.making_status == "processing"
        @order.update(status: 2)
        redirect_to admin_order_path(@order.id)
      elsif @order.order_details.count == @order.order_details.where(making_status: "complete").count
        @order.update(status: 3)
        redirect_to admin_order_path(@order.id)
      else
        redirect_to admin_order_path(@order.id)
      end
    end
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
