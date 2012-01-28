class StoreController < ApplicationController
  def index
    @products = Product.all
    @brands = Brand.all
  end

end
