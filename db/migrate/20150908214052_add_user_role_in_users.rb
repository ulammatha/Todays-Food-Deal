class AddUserRoleInUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_vendor, :boolean, default: false
    add_column :users, :is_admin, :boolean, default: false
  end
end
