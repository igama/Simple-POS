class EmployeeDetail < ActiveRecord::Base
  belongs_to :user
  belongs_to :shop
end
