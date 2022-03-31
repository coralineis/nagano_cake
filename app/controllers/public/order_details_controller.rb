class Public::OrderDetailsController < ApplicationController
  def index
    @order_detail = Order_Detail.new
    @order_details = Order_Detai.all
  end
end
