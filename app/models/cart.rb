class Cart < ActiveRecord::Base
  has_many :cart_items, :dependent => :destroy
  
  def add_product(product_id, price)
    current_item = cart_items.find_by_product_id(product_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = cart_items.build(:product_id => product_id, :product_price => price)
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
