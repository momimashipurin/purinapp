class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @orders = Order.all
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(@order)
    # render :show

    #制作ステータスが～～に変更されたら、注文ステータスを～～に変更
    #商品ごとのステータスでさらに制限



    # @order = Order.find(params[:id])
    # @order_details = @order.order_details
    # if @order.update(order_params)
    #   @order_details.update_all(making_status: "制作待ち") if @order.status == "入金確認"
    # end
    # redirect_to admin_order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

end
