ActiveAdmin.register User do
  
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "User Details", :multipart => true do
      f.inputs :email
      f.inputs :password
      f.inputs :password_confirmation
    end
    
    f.inputs "Details" do
      f.semantic_fields_for :employee_detail do |e|
        e.inputs :first_name
        e.inputs :last_name
        e.input :shop_id, :as => :select, :collection => Shop.all.map { |s| [s.name, s.id] }
      end  
    end    
    f.buttons
  end

  index do
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end

    show do |use|
      attributes_table do
        row :email
        row("status") { use.employee_detail.shop.name }
        row :sign_in_count
        row :last_sign_in_at
        row :created_at
        row :updated_at
      end #end user details
      
      panel "Orders Details" do
        table_for use.orders.all do |t|
          t.column("Order ID") { |order| link_to order.id, admin_order_path(order) }
          t.column("Total Price") { |order| order.total_price }
          t.column("Created At") { |order| order.created_at}
        end  
      end #end Order details

    end #end show
  
sidebar "stats ", :only => :show do  
 
end
  
end
