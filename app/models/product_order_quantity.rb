class ProductOrderQuantity < ActiveRecord::Base
  belongs_to :product, :dependent => :destroy
end
