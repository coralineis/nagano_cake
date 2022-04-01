class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
  end
end
