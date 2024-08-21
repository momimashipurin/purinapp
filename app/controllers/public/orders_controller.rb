class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  include ApplicationHelper

  def new
    @order = Order.new
    @shipping_addresses = current_customer.shipping_addresses
  end

  def confirm
    if !params[:order].present?
      redirect_to new_order_path and return
    end
    
    @cart_items = current_customer.cart_items
    @shipping_fee = 800
    @total_price = calculate_total(@cart_items) + @shipping_fee
    
    @order = Order.new(order_params)
    
    if @order.payment_type.nil? # 支払い方法の確認
      flash[:alert] = "支払い方法を選択してください。"
      redirect_to new_order_path and return
    end
  
    if @order.payment_type == "クレジットカード" # 支払い方法の処理
      session[:selected_pay_method] = "クレジットカード"
      @selected_pay = 0
    else
      session[:selected_pay_method] = "銀行振込"
      @selected_pay = 1
    end
    
    case params[:order][:address_type] # お届け先の確認
    when "member_address"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
      @selected_address = "#{current_customer.postal_code} #{current_customer.address} #{current_customer.last_name + current_customer.first_name}"
    when "registered_address"
      if !params[:order][:shipping_addresses_id].present?
          flash[:alert] = "配送先を選択して下さい。"
        redirect_to new_order_path and return
      end
      shipping_address = current_customer.shipping_addresses.find(params[:order][:shipping_addresses_id])
      @order.postal_code = shipping_address.postal_code
      @order.address = shipping_address.address
      @order.name = shipping_address.name
      @address_type = "registered_address"
      @selected_address = "#{shipping_address.postal_code} #{shipping_address.address} #{shipping_address.name}"
    
    when "new_address"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
      
      unless @order.postal_code.present? && @order.address.present? && @order.name.present?
        flash[:alert] = "新しいお届け先の情報をすべて入力してください。"
        redirect_to new_order_path and return
      end
      @selected_address = "#{@order.postal_code} #{@order.address} #{@order.name}"
    else
      flash[:alert] = "お届け先を選択してください。"
      redirect_to new_order_path and return
    end
    
    session[:selected_address] = @selected_address
    
    @cart_items = current_customer.cart_items # カートアイテムの価格と送料を計算する
    @shipping_fee = 800
    @cart_items_price = @cart_items.sum { |item| item.item.price * item.amount }
    @total_price = @cart_items_price + @shipping_fee

    @order.shipping_cost = @shipping_fee # 確認画面で表示するためにセッションに保存
    @order.total_payment = @total_price
    session[:order] = @order.attributes
  end

  def create
    @order = Order.new
    @order.customer = current_customer
    @order.payment_type = params[:payment_type].to_i
    @order.postal_code = params[:postal_code]
    @order.address = params[:address]
    @order.name = params[:name]
    @order.shipping_cost = params[:shipping_cost].to_i
    
    @order.total_payment = calculate_total(current_customer.cart_items)
    
    total_items_price = calculate_total(current_customer.cart_items).delete(',').to_i # 合計金額の計算
    @order.total_payment = total_items_price + @order.shipping_cost
    
    @order.save!
    current_customer.cart_items.each do |cart_item| # 注文詳細を作成
      @order.order_details.create!(
        item: cart_item.item,
        price: cart_item.item.price,
        amount: cart_item.amount
      )
    end
    
    current_customer.cart_items.destroy_all # カートをクリア

    session.delete(:order) # 注文情報を削除

    redirect_to complete_orders_path
  end

  def index
    @orders = Order.where(customer_id: current_customer.id).order(created_at: :desc)
    def status_i18n
      I18n.t("activerecord.attributes.order.statuses.#{status}")
    end
    @order = Order.page(params[:order]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @order_details= OrderDetail.where(order_id: @order.id)
  end

  private

  def order_params
    params.require(:order).permit(:payment_type, :postal_code, :address, :name, :shipping_cost, :total_payment)
  end
end