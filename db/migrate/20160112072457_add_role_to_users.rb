class AddRoleToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :is_admin, :boolean
  end
  def down
  	remove_column :users, :is_admin
  end
end
