class Shop < ActiveRecord::Base
  has_many :employee_detais

  validates :name, :presence => true
  validates :name, :uniqueness => true

end
