class OrderReportController < ApplicationController
  # GET /order_report/1
  # GET /order_report/1.json
  def generate
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    
  end

end
