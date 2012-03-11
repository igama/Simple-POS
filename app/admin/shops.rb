ActiveAdmin.register Shop do


  show do |shop|
    
    table_for shop.users.all do |t|
      t.column("Username") { |user| link_to user.email, admin_user_path(user) }
      t.column("Name") {|user| user.name }
      t.column("Shop") { |user| user.shop.name }
      t.column("Last Login") { |user| user.last_sign_in_at}
      t.column("Sign in Count") {|user| user.sign_in_count}
    end

  end

  sidebar :shop, :only => :show do
    attributes_table_for resource do
        row :id
        row :name
        row :created_at
        #row ("Employee") { User.find_by_shop_id(resource.id) }
    end
  end

end
