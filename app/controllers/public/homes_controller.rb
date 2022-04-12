class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @item = Item.limit(4).order("created_at DESC").where(is_active: "販売中")
  end

end
