ActiveAdmin.register User do
  menu :parent => "_Manage Users"

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "User Details", :multipart => true do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    
    f.inputs "Details" do
      f.semantic_fields_for :employee_detail do |e|
        e.inputs :first_name, :last_name, :name => "employee"
        #e.inputs :shop_id, :as => :select, :collection => Shop.all, :label_method => :name, :value_method => :id
        e.inputs :shop, :as => :select, :collection => Shop.all.map { |s| [s.name, s.id] }
      end  
    end    
    f.buttons
  end

  index do |t|
    t.column("Username") { |user| user.email}
    t.column("Name") {|user| user.employee_detail.first_name + " " + user.employee_detail.last_name }
    t.column("Shop") { |user| user.employee_detail.shop_id }
    t.column("Last Login") { |user| user.last_sign_in_at}
    t.column("Sign in Count") {|user| user.sign_in_count}
    default_actions
  end

    show do |user|
      attributes_table do
        row :email
        row :sign_in_count
        row :last_sign_in_at
        row :created_at
        row :updated_at
      end #end user details
      
      panel "Orders Details" do
        table_for user.orders.all do |t|
          t.column("Order ID") { |order| link_to order.id, admin_order_path(order) }
          t.column("Total Price") { |order| order.total_price }
          t.column("Created At") { |order| order.created_at}
        end  
      end #end Order details
      active_admin_comments
    end #end show
  
sidebar "stats ", :only => :show do  
 
end
  
end
