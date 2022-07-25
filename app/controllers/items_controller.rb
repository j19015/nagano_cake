class ItemsController < ApplicationController
  def index
    @genres=Genre.all
    @items=Item.all
  end

  def show
    @item=Item.find(params[:id])
  end
end
