module OrdersHelper
  
  def get_product_name(product_id)
    product = Product.find_by_id(product_id)
    return product.name
  end
  
end
