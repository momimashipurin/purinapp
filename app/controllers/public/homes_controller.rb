class Public::HomesController < ApplicationController
  def top
     @items = Item.all.order(created_at: :desc)  #新しい順の画像を表示。
     @genres = Genre.all
  end

  def about
  end

end
