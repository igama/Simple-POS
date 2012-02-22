ActiveAdmin.register Order do
  
  scope :all, :default => true
  scope :last_week do |orders|
      orders.where('created_at < ? and created_at > ?', Time.now, 1.week.ago)
  end

  filter :user, :as => :select, :collection => User.all.map { |u| [u.email, u.id] }
  filter :created_at

  show do |order|
    attributes_table do
      row :id
      row :name
      row :address
      row :email
      row :pay_type
      row :created_at
      row :updated_at
      row :user
    end
    
    panel "Products" do 
      table_for  order.order_items.all do |t|
        t.column("Product") { |t| t.product.name }
        t.column("Condition") {|t| t.product_condition }
        t.column("Price") { |t| t.product_price }
        t.column("Quantity") { |t| t.quantity }
        t.column("Total Price") { |t| t.total_price }
      end
    end

        
  end #end show
  
end
