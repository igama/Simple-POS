class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.integer :cart_id
      t.integer :product_id
      t.decimal :product_price
      t.string :product_condition

      t.timestamps
    end
  end
end
