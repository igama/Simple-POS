class Product < ActiveRecord::Base
  #attr_accessor :image_file_name
  #attr_accessor :image_content_type
  #attr_accessor :image_file_size
  #attr_accessor :image_updated_at
  #image = Product.new(:image => File.open('/path/to/my/image.png', rb))
  
  
  # Relations
  belongs_to :brand
  has_many  :cart_items
  has_one :product_order_quantity

  has_attached_file :image, 
    :styles => {
      :thumb => "70x70" }
  
  #check before destroy
  before_destroy :ensure_not_referenced_by_any_cart_item
  before_save :ensure_reference_number
  
  # Validations
  validates :name, :price, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.00}
  validates :name, :uniqueness => true
  
  CATEGORY_TYPES = [ "Mobile", "Tablet" ]
  PRODUCT_CONDITION = ["Good", "Bad"]
  
  #Scop
  #default_scope :order => 'name'
  
  def self.search_old(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
  
  def self.search(search)
    if search
      #where('name LIKE ? or name LIKE ?', "%iphone%", "%16gb%")
      where(search)
    else
      all
    end
  end
  
  
  private
  
  def ensure_not_referenced_by_any_cart_item
    if cart_items.empty?
      return true
    else
      errors.add(:base, 'Cart Items present')
      return false
    end
  end

  def ensure_reference_number
    if self.reference.blank?
      refid = Product.find(:all, :select => "DISTINCT reference", :order => 'reference DESC')

      puts " -------------- \n "
      puts "IN MODEL"
      puts refid.to_s
      puts refid[0].reference.to_s
      puts " -------------- \n " 

      if refid[0].reference >= 10000
        self.reference = refid[0].reference + 1
      else
        self.reference = 10000
      end  
    end 
  end
  
  
  
end
