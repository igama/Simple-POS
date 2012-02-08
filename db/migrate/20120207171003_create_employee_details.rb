class CreateEmployeeDetails < ActiveRecord::Migration
  def change
    create_table :employee_details do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.integer :shop_id

      t.timestamps
    end
  end
end
