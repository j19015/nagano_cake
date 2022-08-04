class Admin::OrdersController < ApplicationController
  def show
    @order=Order.find(params[:id])
  end

  def index
    @orders=Order.all
  end

  def update
    @order=Order.find(params[:id])
    @order.update(order_status_params)
     #①注文ステータスが 入金確認 → 全ての製作ステータスを 製作待ち
     if Order.order_statuses[@order.order_status]==1
      @order.order_details.each do |order_detail|
        order_detail.update(order_status:1)
      end
    end
    redirect_to admin_order_path(@order.id)
  end
  private

  def order_status_params
    params.require(:order).permit(:order_status)
  end
end
