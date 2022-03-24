class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[])
  end

  def edit
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image, :is_active)
  end
end
