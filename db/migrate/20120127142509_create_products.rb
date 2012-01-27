class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :image_url
      t.decimal :price, :precision => 8, :scale => 2
      t.integer :brand_id, :default => 1
      t.string :category, :default => "Mobile"

      t.timestamps
    end
  end
end
