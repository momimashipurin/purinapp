class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show

  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_my_page_path, notice: '会員情報が更新されました。'
    else
      render :edit
    end
  end

  def check
  end

  def out
    @customer = current_customer
    @customer.update(is_active: false)  #is_activeカラムをfalseにupdateして、退会状態にする。実際にはデータベース上の会員のレコードは削除されない。
    reset_session      #セッション情報（個人の情報やアクションの履歴などの情報）をリセット
    flash[:notice] = "退会しました"
    redirect_to root_path
  end

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :password)
  end
end
