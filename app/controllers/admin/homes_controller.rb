class Admin::HomesController < ApplicationController
  def top
    #if @orders >= 10
    @orders = Order.all.page(params[:page]).per(10) #ページネーション
  end
end
