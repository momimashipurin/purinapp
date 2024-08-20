class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
    @item_page = Item.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item.id)
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
    item.update(item_params)
    redirect_to admin_item_path(item.id)
  end

  private
    def item_params
        params.require(:item).permit(:genre_id, :name, :introduction, :price, :item_image, :is_active)
    end

end
