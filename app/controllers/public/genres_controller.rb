class Public::GenresController < ApplicationController
  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @items = Item.page(params[:page]).per(6)
  end
end
