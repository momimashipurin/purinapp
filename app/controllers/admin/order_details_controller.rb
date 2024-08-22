class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_params)
    redirect_to admin_order_path(@order_detail.order), notice: '更新が成功しました'
    
    #注文ステータスが～～に変更されたら、制作ステータスを～～に変更
  end

  private

  def order_params
    params.require(:order_detail).permit(:making_status)
  end

end
