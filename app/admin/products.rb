ActiveAdmin.register Product do
    
  form :html => { :enctype => "multipart/form-data"} do |f|
    f.inputs "Product", :multipart => true do
      f.input :name
      f.input :brand, :as => :select
      f.input :price
      f.input :wholesale
      f.input :image, :as => :file
    end
    f.buttons
  end


  index do
    column "Image" do |product|
        link_to(image_tag(product.image.url(:thumb)),admin_product_path(product))
      end
    column :id
    column :name
    column :brand
    column :price
    default_actions
  end

  filter :brand
  filter :name
  filter :price
  filter :created_at

  show do
    attributes_table do
      row :id
      row :name
      row :brand
      row :price
      row :wholesale
      row "Image" do |product|
        image_tag product.image
      end
    end
  end

end
