ActiveAdmin.register_page "Report" do
	#menu :label => "My Menu Item Label", :parent => "Dashboard"

      @TopProducts = ProductOrderQuantity.limit(10)
      @orders = Order.where('created_at < ? and created_at > ?', Time.now, 1.week.ago)
      

  	action_item do
      link_to "View Site", "/"
    end

    content do
      @orders = Order.all
      @something = params[:id]
      #@orders.order_items.each do |order_item|

      #end

      render :partial => "test", :locals => {:something => @something}


    end

end