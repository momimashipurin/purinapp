module ApplicationHelper
    
  def calculate_price_including_tax(price) #税込価格表示用メソッド設定（byみっころ）
    tax_rate = 1.08
    total_price =(price * tax_rate).floor
     number_to_currency(total_price, unit: "", delimiter: ",", precision: 0) #数字にカンマを追加し、小数点以下を表示せず、円マークを付けない
  end
  
  def format_price(price) #税抜価格表示用メソッド設定（byみっころ）
    number_to_currency(price, unit: "", delimiter: ",", precision: 0) # 数字にカンマを追加し、小数点以下を表示せず、円マークを付けない
  end
  
  def calculate_subtotal(cart_item) #小計表示用メソッド設定（byみっころ）
    unit_price = cart_item.item.price
    quantity = cart_item.amount
    subtotal = unit_price * quantity
    calculate_price_including_tax(subtotal)
  end
  
  def calculate_total(cart_items) #合計表示用メソッド設定（byみっころ）
    total = cart_items.sum do |cart_item|
      unit_price = cart_item.item.price
      quantity = cart_item.amount
      unit_price * quantity
    end
    calculate_price_including_tax(total)
  end
end