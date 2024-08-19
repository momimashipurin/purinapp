class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all.page(params[:page]).per(10) #ページネーション
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
  end

  def update
  end
end
