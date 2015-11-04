class AddDeleteAtToDeals < ActiveRecord::Migration
  def up
    add_column :deals, :deleted_at, :datetime
  end

  def down

  end
end
