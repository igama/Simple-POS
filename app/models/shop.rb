class Shop < ActiveRecord::Base
  has_many :users
  has_many :orders, :through => :users

  validates :name, :presence => true
  validates :name, :uniqueness => true

end
