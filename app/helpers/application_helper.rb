module ApplicationHelper
  include ActionView::Helpers::NumberHelper
    
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
    return 0 unless cart_items.present? && cart_items.any? #追記（byみっころ）
  
    total = cart_items.sum do |cart_item|
      unit_price = cart_item.item.price
      quantity = cart_item.amount
      unit_price * quantity
    end
    calculate_price_including_tax(total)
  end
  
  def calculate_total_with_shipping_fee(cart_items, shipping_fee) #追加（byみっころ）
    total = cart_items.sum do |cart_item|
      unit_price = cart_item.item.price
      quantity = cart_item.amount
      unit_price * quantity
    end
    
    total_with_shipping = total + shipping_fee #追加（byみっころ）

    calculate_price_including_tax(total_with_shipping) #追加（byみっころ）
  end

end