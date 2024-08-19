class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  
  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    if @cart_item.save
      flash[:notice] = "商品をカートに入れました。"
      redirect_to cart_items_path
    else
      flash[:notice] = "個数を選択してください。"
      redirect_to item_path(params[:cart_item][:item_id])
    end
  end

  def index
    
  end

  def update
  end

  def destroy
  end

  def clear
  end
  
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
