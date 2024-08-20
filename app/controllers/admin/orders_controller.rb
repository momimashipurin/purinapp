class Admin::OrdersController < ApplicationController
  def show
    #@order = Order.find(params[:id])
    @items = Item.all #注文した商品を全て表示したいからall?
    @customer = Customer.find(params[:id])
  end

  def update
  end
end
