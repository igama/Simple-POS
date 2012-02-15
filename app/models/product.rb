class Product < ActiveRecord::Base
  # Relations
  belongs_to :brand
  has_many  :cart_items
  has_one :product_order_quantity
  
  #check before destroy
  before_destroy :ensure_not_referenced_by_any_cart_item
  
  # Validations
  validates :name, :price, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.00}
  #validates :name, :uniqueness => true
  
  CATEGORY_TYPES = [ "Mobile", "Tablet" ]
  PRODUCT_CONDITION = ["Working", "Broken"]
  
  #Scop
  default_scope :order => 'name'
  
  private
  
  def ensure_not_referenced_by_any_cart_item
    if cart_items.empty?
      return true
    else
      errors.add(:base, 'Cart Items present')
      return false
    end
  end
  
  
  
end
