class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail=OrderDetail.find(params[:id])
    @order_detail.update(order_status_params)

    #②製作ステータスが一つでも 製作中 → 注文ステータスを 製作中
    #③製作ステータスが全て 製作完了 → 注文ステータスを 発送準備中

    #order1が制作ステータスが一つでも製作中を判断するための変数
    order1=false
    #order2が制作ステータスが全部制作完了かどうかを判断するための変数
    order2=0
    #@orderに注文詳細の親の注文情報を格納
    @order=@order_detail.order
    #注文情報に紐づいた注文詳細の中をトレースして精査
    @order.order_details.each do |order_detail|
      if OrderDetail.order_statuses[order_detail.order_status]==2
        #製作中なら
        order1=true
      elsif OrderDetail.order_statuses[order_detail.order_status]==3
        #制作完了なら
        order2+=1
      end
    end

    if order2==@order.order_details.count
      #全ての商品が制作完了している場合
      @order.update(order_status:3)    
    elsif order1==true
      #一つでも製作中なら
      @order.update(order_status:2)
    end
    redirect_to admin_order_path(@order_detail.order.id)
  end
  private
  def order_status_params
    params.require(:order_detail).permit(:order_status)
  end
end
