OrderItem.all.each do |item|
  @prod = ProductOrderQuantity.find_by_product_id(item.product_id)
  if @prod != nil
    puts "Quantity = #{@prod.quantity}"
    @prod.quantity = @prod.quantity + item.quantity
    @prod.save!
  else
   @nprod = ProductOrderQuantity.new
   @nprod.product_id = item.product_id
   @nprod.quantity = item.quantity
   @nprod.save!
  end
end