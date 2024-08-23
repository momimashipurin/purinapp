class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    
    if @order_detail.update(order_params)
      if @order_detail.making_status == "製作中"  #制作ステータスが１つでも「製作中」になったら、自動で注文ステータスが「製作中」になる
        @order_detail.order.update!(status: :製作中)  #[update!メソッド]例外が例外が発生した場合にエラーメッセージを表示
      elsif @order_detail.making_status == "製作完了" #制作ステータスが１つでも「製作完了」になったら、自動で注文ステータスが「発送準備中」になる
        @order_detail.order.update!(status: :発送準備中)
      end
      redirect_to admin_order_path(@order_detail.order), notice: '更新が成功しました'
    else
      redirect_to admin_path#追加設定
    end
  end

  private

  def order_params
    params.require(:order_detail).permit(:making_status)
  end

end
