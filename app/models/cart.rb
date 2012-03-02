class Cart < ActiveRecord::Base
  has_many :cart_items, :dependent => :destroy
  
  def add_product(product_id, price, condition)
    #current_item = cart_items.find(:product_id => product_id, :product_condition => condition)
    current_item = cart_items.where("product_id = ? AND product_condition = ?",product_id,condition)
    
    if !current_item.empty?
      item = current_item.first
      item.quantity = item.quantity + 1
      return item
    else
      if condition == 'Bad'
        new_price = price.to_f/"2.00".to_f
        current_item = cart_items.build(:product_id => product_id, :product_price => new_price, :product_condition => condition)
      else
        current_item = cart_items.build(:product_id => product_id, :product_price => price, :product_condition => condition)
      end
    end
    current_item
  end
  
  def total_price
    cart_items.to_a.sum { |item| item.total_price }
  end
  
  def total_items 
    cart_items.sum(:quantity)
  end
  
end
