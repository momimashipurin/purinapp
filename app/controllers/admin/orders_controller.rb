class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    
    @intax = 0 #税込み価格を格納する変数
    @sum = 0 #小計を格納する変数
    @total_price = 0 #商品合計を格納する変数
    
    @order.order_details.each do |order_detail|
      @intax = order_detail.item.price * 1.08 #税抜価格*1.08
      @sum = @intax * @order.order_detail.amount #税込価格*数量
      @total_price += @sum #商品合計=商品合計+小計
    end

    
    @items = Item.all #注文した商品を全て表示したいからall?
    @customer = Customer.find(params[:id])
  end

  def update
  end
end
