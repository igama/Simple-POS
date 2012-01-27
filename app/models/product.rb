class Product < ActiveRecord::Base
  # Relations
  belongs_to :brand
  
  # Validations
  #validates :name, :price, :presence => true
  #validates :price, :numericality => {:greater_than_or_equal_to => 0.00}
  #validates :name, :uniqueness => true
  
  CATEGORY_TYPES = [ "Mobile", "Tablet" ]
  
  
  
end
