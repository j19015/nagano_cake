class ItemsController < ApplicationController
  def index
    @genres=Genre.all
    @items=Item.all
  end

  def search
    @genres=Genre.all
    @items=Item.where('genre_id Like ?',params[:genre_id])
    render :index
  end

  def show
    @genres=Genre.all
    @cart_item=CartItem.new
    @item=Item.find(params[:id])
  end
end
