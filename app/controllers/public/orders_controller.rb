class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:select_address] == '0'
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name
    elsif params[:order][:select_address] == '1'
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
    @orders = current_customer.cart_items
    @total_payment = @orders.inject(0) {|sum, item| sum + item.subtotal }
  end

  def create
    @order = Order.new(order_params)
    @order.save
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.item_id = cart_item.item.id
      @order_detail.order_id = @order.id
      @order_detail.price = @order.total_payment
      @order_detail.amount = cart_item.amount
    end
    current_customer.cart_items.destroy_all
    redirect_to complete_path
  end

  def index
    @order_details = OrderDetail.all
  end

  def show
    @order_detail = OrderDetail.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end
end
