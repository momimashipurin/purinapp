class Public::CustomersController < ApplicationController
  def show
  end

  def edit
  end

  def update
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
end
