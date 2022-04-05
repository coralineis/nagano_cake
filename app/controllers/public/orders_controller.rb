class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @order = Address.find(params[:order][:address_id])
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.full_name
  end

  def complete
  end

  def create
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end
end
