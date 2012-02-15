class CreateProductOrderQuantities < ActiveRecord::Migration
  def change
    create_table :product_order_quantities do |t|
      t.integer :product_id
      t.integer :quantity

      t.timestamps
    end
  end
  
  
  
end
