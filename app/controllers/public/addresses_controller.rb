class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @shipping_address = ShippingAddress.new
    @customer = current_customer
    @shipping_addresses = @customer.shipping_addresses
  end

  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    customer_id = current_customer.id
    @shipping_address.customer_id = customer_id
    if @shipping_address.save
      flash[:success] = "新しい配送先の登録が完了しました。"
      redirect_to addresses_path
    else
      flash.now[:danger] = "登録に失敗しました。新しい配送先内容に不備があります。"
      @shipping_address = ShippingAddress.new
      @customer = current_customer
      @shipping_addresses = @customer.shipping_addresses
      render :index
    end
  end

  def edit
    @shipping_address = ShippingAddress.find(params[:id])
  end

  def update
    @shipping_address = ShippingAddress.find(params[:id])
    if @shipping_address.update(shipping_address_params)
      redirect_to addresses_path
    else
      flash.now[:danger] = "登録の更新に失敗しました。更新内容に不備があります。"
      render :edit
    end
  end

  def destroy
    shipping_address = ShippingAddress.find(params[:id])
    shipping_address.destroy
    redirect_to request.referer
  end

  private

  def  shipping_address_params
    params.require(:shipping_address).permit(:name, :postal_code, :address)
  end
end
