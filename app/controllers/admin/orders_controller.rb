class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @orders = Order.all
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details

    if @order.update(order_params)  #注文ステータスが「入金確認」になったら、自動で全ての制作ステータスが「製作待ち」になる
      if @order.status == "入金確認"
        @order_details.update_all(making_status: OrderDetail.making_statuses[:製作待ち])
      end
      redirect_to admin_order_path(@order), notice: '更新が成功しました'
    else
      redirect_to admin_path#追加設定
    end
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

end
