class AddUserIdToeatery < ActiveRecord::Migration
  def change
    add_column :eateries, :user_id, :integer
  end
end
