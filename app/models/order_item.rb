class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order
  
  def total_price
    product_price * quantity
  end
  
end
