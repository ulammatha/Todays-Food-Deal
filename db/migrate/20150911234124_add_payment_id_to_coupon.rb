class AddPaymentIdToCoupon < ActiveRecord::Migration
  def up
    add_column :coupons, :payment_id, :integer, :null => false
  end

  def down
    remove_column :coupons, :payment_id
  end
end
