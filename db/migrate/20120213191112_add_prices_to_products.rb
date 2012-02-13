class AddPricesToProducts < ActiveRecord::Migration
  def change
    add_column :products, :wholesale, :decimal, :precision => 8, :scale => 2
  end
end
