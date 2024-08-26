class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  
  def create
  item_id = params[:cart_item][:item_id]
  amount = params[:cart_item][:amount].to_i # 個数の取得
  if amount <= 0 # 個数が0または空である場合
    flash[:alert] = '個数を選択してください。'
    redirect_to item_path(item_id) and return
  end
  
  begin # Item が存在するか確認
    item = Item.find(item_id)
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = '指定された商品が見つかりません。'
    redirect_to items_path and return
  end
  
  @cart_item = current_customer.cart_items.find_by(item_id: item.id) # 現在のカートにアイテムが存在するか確認

  if @cart_item
    @cart_item.amount += amount  # 既にカートにアイテムがある場合、数量を更新
  else
    @cart_item = current_customer.cart_items.build(cart_item_params) # カートにアイテムがない場合、新しいカートアイテムを作成
  end

  if @cart_item.save
    flash[:notice] = '商品をカートに入れました。'
    redirect_to cart_items_path
  else
    flash[:alert] = 'カートにアイテムを追加できませんでした。'
    redirect_to item_path(item_id)
  end
    
  end

  def index
    @cart_items = current_customer.cart_items.includes(:item)
    @cart_items_grouped = @cart_items.group_by(&:item_id).map do |item_id, items|# カートアイテムの中で、同じ商品IDを持つアイテムをグループ化して数量を合計する
      items.first.tap do |cart_item|
        cart_item.amount = items.sum(&:amount)
      end
    end
  end

  def update
    @cart_item = current_customer.cart_items.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to cart_items_path, notice: 'カートが更新されました。'
    else
      redirect_to cart_items_path, alert: 'カートの更新に失敗しました。'
    end
  end

  def destroy #商品一部削除 
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    flash.now[:notice] = "商品をカートから出しました。"
    redirect_to cart_items_path
  end

  def clear #商品全部削除
    current_customer.cart_items.destroy_all
    flash[:notice] = 'カートの中身を空にしました。'
    redirect_to request.referer #cart_items_path # 同じ画面にリダイレクト
  end
  
  private
  
    def cart_item_params
      params.require(:cart_item).permit(:customer_id, :item_id, :amount)
    end
  
end