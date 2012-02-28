class Customer < ActiveRecord::Base
	belongs_to :order

	validates :name, :address, :presence => true
end
