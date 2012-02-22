class StoreController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @products = Product.all
    @brands = Brand.all
    @products = ProductOrderQuantity.where("quantity > ?", 2).limit(10).order("quantity DESC")
    @cart = current_cart
  end

end
