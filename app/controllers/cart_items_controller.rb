class CartItemsController < ApplicationController
  def index
    @cart_items=CartItem.all
  end

  def update
    @cart_item=CartItem.find_by(end_user_id: current_end_user.id,item_id: cart_item_params[:item_id])
    @cart_item.update(amount: cart_item_params[:amount])
    redirect_to cart_items_path
  end

  def create
    if CartItem.find_by(end_user_id: current_end_user.id,item_id: cart_item_params[:item_id])
      @cart_item=CartItem.find_by(end_user_id: current_end_user.id,item_id: cart_item_params[:item_id])
      amount=@cart_item.amount+(cart_item_params[:amount]).to_i
      @cart_item.update(amount: amount)
      flash[:notice]="更新しました"
    else
      @cart_item=CartItem.new(cart_item_params)
      @cart_item.end_user_id=current_end_user.id
      @cart_item.save
      flash[:notice]="保存しました"
    end
    redirect_to cart_items_path
  end

  def destroy
    @cart_item=CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items=CartItem.where(end_user_id: current_end_user)
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:amount,:item_id)
  end

end
