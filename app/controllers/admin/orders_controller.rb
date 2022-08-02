class Admin::OrdersController < ApplicationController
  def show
    
  end

  def index
    @orders=Order.all
  end

  def update
  end
end
