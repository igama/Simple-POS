class AddPricesToProducts < ActiveRecord::Migration
  def change
    add_column :products, :wholesale, :decimal, :default => 0.0, :precision => 8, :scale => 2
  end
end
