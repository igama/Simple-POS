class AddReferenceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :reference, :integer
  end
end
