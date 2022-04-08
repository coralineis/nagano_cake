class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @items = Item.page(params[:page]).per(8)
    @items_all = Item.all
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
  end
end
