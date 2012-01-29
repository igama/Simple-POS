class StoreController < ApplicationController
  def index
    @products = Product.all
    @brands = Brand.all
    @products = Product.all
  end

end
