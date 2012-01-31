class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :product_id
      t.decimal :product_price
      t.string :product_condition

      t.timestamps
    end
  end
end
