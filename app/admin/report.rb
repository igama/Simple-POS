ActiveAdmin.register_page "Report" do
	#menu :label => "My Menu Item Label", :parent => "Dashboard"

      @TopProducts = ProductOrderQuantity.limit(10)
      @orders = Order.where('created_at < ? and created_at > ?', Time.now, 1.week.ago)
      

  	action_item do
      link_to "View Site", "/"
    end

    content do
      @something = "hello marco"
      render :partial => "test", :locals => {:something => @something}

      #panel "Hello World" do
      #  "Why so easy?"
      #end
    end

end