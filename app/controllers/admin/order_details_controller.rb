class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    if @order_detail.update(order_params)
      redirect_to admin_order_path(@order_detail.order.id), notice: '更新が成功しました' #更新できない
      #redirect_to admin_order_path(@order_detail) #別の人のとこに遷移
      #redirect_to admin_order_path#別の人のとこに遷移
      #redirect_to admin_order_path(@order)
    else
      render "admin/"
    end
  end

    private

  def order_params
    params.require(:order_detail).permit(:making_status)
  end

end
