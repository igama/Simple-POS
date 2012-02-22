class EmployeeDetail < ActiveRecord::Base
  belongs_to :user
  belongs_to :shop
  attr_accessible :first_name, :last_name, :shop_id
end
