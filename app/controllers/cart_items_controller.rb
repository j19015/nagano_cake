class CartItemsController < ApplicationController
  before_action :cart_confirm
  def index
    @cart_items=CartItem.all
    @amount=0
  end

  def update
    @cart_item=CartItem.find_by(end_user_id: current_end_user.id,item_id: cart_item_params[:item_id])
    @cart_item.update(amount: cart_item_params[:amount])
    flash[:notice]="商品の個数を更新しました"
    redirect_to cart_items_path
  end

  def create
    if CartItem.find_by(end_user_id: current_end_user.id,item_id: cart_item_params[:item_id])
      @cart_item=CartItem.find_by(end_user_id: current_end_user.id,item_id: cart_item_params[:item_id])
      amount=@cart_item.amount+(cart_item_params[:amount]).to_i
      @cart_item.update(amount: amount)
      flash[:notice]="商品の個数を追加しました"
    else
      @cart_item=CartItem.new(cart_item_params)
      @cart_item.end_user_id=current_end_user.id
      @cart_item.save
      flash[:notice]="カートに商品を新規追加しました"
    end
    redirect_to cart_items_path
  end

  def destroy
    @cart_item=CartItem.find(params[:id])
    @cart_item.destroy
    flash[:notice]="カート内の一部商品の削除を行いました"
    redirect_to cart_items_path
  end

  def destroy_all
    current_end_user.cart_items.destroy_all
    flash[:notice]="カート内の全て商品の削除を行いました"
    redirect_to cart_items_path
  end

  def cart_confirm
    cart_items=current_end_user.cart_items
    cart_items.each do |cart_item|
      if !cart_item.item.is_saled
        flash[:notice]="カート内の販売停止中の表品を削除しました"
        cart_item.destroy
      end
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:amount,:item_id)
  end

end
