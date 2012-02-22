ActiveAdmin.register_page "Report" do
	#menu :label => "My Menu Item Label", :parent => "Dashboard"

  	action_item do
      link_to "View Site", "/"
    end

    content do
      @TopProducts = ProductOrderQuantity.limit(10)
      @orders = Order.where('created_at < ? and created_at > ?', Time.now, 1.week.ago)
      @something = "hello marco"

      render "test"

      #panel "Hello World" do
      #  "Why so easy?"
      #end
    end

end