ActiveAdmin.register User do
  
  index do
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end
  
  form do |f|
    f.inputs "User Details" do
      f.inputs :email
      f.inputs :password
      f.inputs :password_confirmation
    end
   f.buttons
  end
  
end
