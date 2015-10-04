class AddCouponStatusToCoupon < ActiveRecord::Migration
  def up
    add_column :coupons, :status, :boolean, :default => true
  end
  def down
    add_column :coupons, :status, :boolean
  end
end
