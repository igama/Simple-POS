ActiveAdmin.register_page "Report" do
	#menu :label => "My Menu Item Label", :parent => "Dashboard"

      @TopProducts = ProductOrderQuantity.limit(10)
      #@orders_1_week = Order.where('created_at < ? and created_at > ?', Time.now, 1.week.ago)
      #@orders_start_month

  	action_item do
      link_to "View Site", "/"
    end

    content do
      @orders = Order.all
      @something = params[:id]
      #@orders.order_items.each do |order_item|
      @orders = Order.count(:all, :conditions => ["created_at >= ?", Date.today.at_beginning_of_month], :group => "DATE(created_at)")
      
      #end

      render :partial => "test", :locals => {:something => @something}


    end

end