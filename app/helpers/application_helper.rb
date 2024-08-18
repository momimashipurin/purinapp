module ApplicationHelper
    
   def calculate_price_including_tax(price)
    tax_rate = 1.08
    (price * tax_rate).floor
  end
#   ↑/purinapp/app/views/public/items/show.html.erbの税込価格表示用メソッド設定（byみっころ）
end