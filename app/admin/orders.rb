ActiveAdmin.register Order do
  
  scope :all, :default => true
  scope :last_week do |orders|
      orders.where('created_at < ? and created_at > ?', Time.now, 1.week.ago)
  end

  index do
    column :id
    column "Total Items" do |order|
      order.total_items
    end
    column "Total Price" do |order|
      order.total_price
    end
    column "Shop" do |order|
      order.user.employee_detail.shop.name
    end
    column "Employee" do |order|
      order.user.employee_detail.first_name
    end
    column :created_at
    default_actions
  end

  #filter :created_at

  show do |order|

    render :partial => "info", :locals => {:order => order}
        
  end #end show
  
end
