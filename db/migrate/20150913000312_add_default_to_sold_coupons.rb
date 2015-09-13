class AddDefaultToSoldCoupons < ActiveRecord::Migration
  def up
    change_column :deals, :sold_coupons, :integer, :default => 0
  end
  def down
    change_column :deals, :sold_coupons, :integer
  end
end
