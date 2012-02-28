class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.integer :order_id
      t.string :name
      t.text :address
      t.string :postcode
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
