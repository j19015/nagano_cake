class OrdersController < ApplicationController
  def new
    @order=Order.new
  end

  def confirm
    @order=Order.new(order_params)
    if params[:order][:address_select]=="1"
      #自身の住所を配送先として設定した場合
      #@order.address=current_end_user.full_address
      @order.post_code=current_end_user.post_code
      @order.address=current_end_user.address
      @order.name=current_end_user.first_name+current_end_user.last_name
    elsif params[:order][:address_select]=="2"
      #配送先登録済みの中から選択を行なった場合
      order=current_end_user.addresses.find(params[:order][:address_id])
      @order.post_code=order.post_code
      @order.address=order.address
      @order.name=order.name
    else
      #新規の住所を配送先として設定する場合
      #@order.address="〒"+params[:order][:post_code]+" "+params[:order][:address]+" "+params[:order][:name]
      @order.post_code=params[:order][:post_code]
      @order.address=params[:order][:address]
      @order.name=params[:order][:name]
    end
    @order.pay_method=params[:order][:pay_method]
    @order.total_payment=0
  end

  def complete
  end

  def create
    @order=current_end_user.orders.new(order_params_complete)
    @order.postage=800
    @order.order_status=0
    if @order.save!
      current_end_user.cart_items.each do |cart_item|
        @cart_item=@order.order_details.new(item_id:cart_item.item.id,price: cart_item.item.price,amount: cart_item.amount,order_status: Order.order_statuses.key(0))
        binding.pry
        @cart_item.save
      end
      current_end_user.cart_items.destroy_all
      flash[:notice]="注文を受け付けました。"
      redirect_to orders_complete_path
    else
      flash[:notice]="エラーが発生しました。"
      render :confirm
    end
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:pay_method,:address,:total_payment)
  end
  def order_params_complete
    params.require(:order).permit(:name,:post_code,:pay_method,:address,:total_payment)
  end
end
