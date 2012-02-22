Order.transaction do 
  (1..5).each do |i|
    @ad = Order.new()
    @ad.name = "Name #{i}"
    @ad.address = "#{i} Strett"
    @ad.email = "#{i}@localhost"
    @ad.pay_type = "Cash"
    @ad.user_id = 1
    product = Product.find_by_id(1)
    @ad.order_items.build(:order_id => @ad.id, :product_id => product.id, :product_price => product.price, :quantity => 1, :product_condition => "Working")
    product = Product.find_by_id(10)
    @ad.order_items.build(:order_id => @ad.id, :product_id => product.id, :product_price => product.price, :quantity => 3, :product_condition => "Working")
    product = Product.find_by_id(30)
    @ad.order_items.build(:order_id => @ad.id, :product_id => product.id, :product_price => product.price, :quantity => 2, :product_condition => "Working")
    product = Product.find_by_id(42)
    @ad.order_items.build(:order_id => @ad.id, :product_id => product.id, :product_price => product.price, :quantity => 1, :product_condition => "Working")
    @ad.save!
  end 
  
  (1..5).each do |i|
    @ad = Order.new()
    @ad.name = "Name #{i}"
    @ad.address = "#{i} Strett"
    @ad.email = "#{i}@localhost"
    @ad.pay_type = "Cash"
    @ad.user_id = 1
    product = Product.find_by_id(2)
    @ad.order_items.build(:order_id => @ad.id, :product_id => product.id, :product_price => product.price, :quantity => 1, :product_condition => "Working")
    product = Product.find_by_id(31)
    @ad.order_items.build(:order_id => @ad.id, :product_id => product.id, :product_price => product.price, :quantity => 1, :product_condition => "Working")
    @ad.save!
  end
  
  (1..15).each do |i|
    @ad = Order.new()
    @ad.name = "Name #{i}"
    @ad.address = "#{i} Strett"
    @ad.email = "#{i}@localhost"
    @ad.pay_type = "Cash"
    @ad.user_id = 2
    product = Product.find_by_id(4)
    @ad.order_items.build(:order_id => @ad.id, :product_id => product.id, :product_price => product.price, :quantity => 1, :product_condition => "Working")
    product = Product.find_by_id(14)
    @ad.order_items.build(:order_id => @ad.id, :product_id => product.id, :product_price => product.price, :quantity => 3, :product_condition => "Working")
    product = Product.find_by_id(32)
    @ad.order_items.build(:order_id => @ad.id, :product_id => product.id, :product_price => product.price, :quantity => 2, :product_condition => "Working")
    product = Product.find_by_id(22)
    @ad.order_items.build(:order_id => @ad.id, :product_id => product.id, :product_price => product.price, :quantity => 1, :product_condition => "Working")
    @ad.save!
  end
  
end