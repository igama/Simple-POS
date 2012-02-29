ActiveAdmin.register Product do
  
  index do
    column :id
    column :name
    column :brand
    column :price
  end

  filter :brand
  filter :name
  filter :price
  filter :created_at
  
 

end
