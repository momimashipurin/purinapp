class Public::ItemsController < ApplicationController
  
  def index
    @items = Item.page(params[:page]).per(8)
    @items_all = Item.all
    # @genres = Genre.all　←表示必要であればジャンル一覧作成後追加by（みっころ）
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  
end
