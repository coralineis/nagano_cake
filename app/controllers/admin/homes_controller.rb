class Admin::HomesController < ApplicationController
  def top
    @orders = Order.page(params[:page]).order(id: "DESC")
  end
end
