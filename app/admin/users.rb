ActiveAdmin.register User do
  
  index do
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end
  
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
        e.inputs :shop_id
      end  
    end    
    f.buttons
  end
  
end
