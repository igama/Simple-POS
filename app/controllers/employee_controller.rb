class EmployeeController < ApplicationController
  
  def index
    @orders = Order.find_all_by_user_id(current_user.id)
   
    @orders_total_price = 0
    @orders.each do |order|
      @orders_total_price += order.total_price
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end
end
