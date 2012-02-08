class Order < ActiveRecord::Base
  has_many :order_items, :dependent => :destroy
  belongs_to :user
  
  PAYMENT_TYPES = ["Cash", "Check", "Paypal"]
  
  validates :name, :address, :email, :pay_type, :presence => true
  validates :pay_type, :inclusion => PAYMENT_TYPES
  
  def total_price
    order_items.to_a.sum { |item| item.total_price }
  end
  
  def total_items 
    order_items.sum(:quantity)
  end
  
  def add_cart_items_from_cart(cart)
    cart.cart_items.each do |item|
      item.cart_id = nil
      add_product(item.product_id, item.product_price, item.quantity, item.product_condition)
    end
  end
  
  def add_product(product_id, price, quantity, condition)
    current_item = order_items.build(:product_id => product_id, :product_price => price, :quantity => quantity, :product_condition => condition)
  end
  
end
