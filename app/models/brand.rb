class Brand < ActiveRecord::Base
  has_many :products
  
  validates :name, :presence => true
  validates :name, :uniqueness => true

  has_attached_file :logo, 
    :styles => {
      :thumb => "70x70" }
  
end
