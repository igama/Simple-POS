class Product < ActiveRecord::Base
  belongs_to :brand
  
  CATEGORY_TYPES = [ "Mobile", "Tablet" ]
  
end
