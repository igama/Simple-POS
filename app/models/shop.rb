class Shop < ActiveRecord::Base
  has_many :employee_detais
  has_many :orders, :through => :users

  validates :name, :presence => true
  validates :name, :uniqueness => true

end
