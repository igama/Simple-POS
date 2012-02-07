class StoreController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @products = Product.all
    @brands = Brand.all
    @products = Product.all
    @cart = current_cart
  end

end
