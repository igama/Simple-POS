class OrderReportController < ApplicationController
  before_filter :authenticate_user!
  # GET /order_report/1
  # GET /order_report/1.json
  def generate
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "Niony-#{@order.id}"
      end
    end
    
  end

end
