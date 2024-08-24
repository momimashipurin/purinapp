class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @items = Item.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "新しい商品を登録しました"
      redirect_to admin_item_path(@item.id)
    else
      @item = Item.new
      flash[:notice] = "商品の登録ができませんでした"
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @genre = Genre.find(@item.genre_id)
    @tax_rate = 0.08
    @tax_included_price = (@item.price * (1 + @tax_rate)).round
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      flash[:notice] = "商品情報が更新されました"
      redirect_to admin_item_path(item.id)
    else
      @item = Item.find(params[:id])
      flash[:notice] = "商品の更新ができませんでした"
      render :edit
    end
  end

  private
    def item_params
        params.require(:item).permit(:genre_id, :name, :introduction, :price, :item_image, :is_active)
    end

end
