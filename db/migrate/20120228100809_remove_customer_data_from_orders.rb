class RemoveCustomerDataFromOrders < ActiveRecord::Migration
  def up
    remove_column :orders, :name
    remove_column :orders, :address
    remove_column :orders, :email
  end

  def down
    add_column :orders, :email, :string
    add_column :orders, :address, :text
    add_column :orders, :name, :string
  end
end
