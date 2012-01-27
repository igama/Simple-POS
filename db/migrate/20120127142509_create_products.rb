class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :image_url
      t.decimal :price
      t.integer :brand_id
      t.integer :category_id

      t.timestamps
    end
  end
end
