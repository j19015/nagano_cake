class Admin::OrderDetailsController < ApplicationController
  def update
    order_detail=OrderDetail.find(params[:id])
    order_detail.update(order_status_params)
    redirect_to admin_order_path(order_detail.order.id)
  end
  private
  def order_status_params
    params.require(:order_detail).permit(:order_status)
  end
end
