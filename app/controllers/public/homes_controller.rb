class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @item = Item.limit(4).order("created_at DESC")
  end

end
