module ApplicationHelper
  def flash_class(level)
  case level
  when :notice then 'info'
  when :error then 'error'
  when :alert then 'warning'
  end
  end

  def get_product_name(product_id)
    product = Product.find_by_id(product_id)
    return product.name
  end

end
