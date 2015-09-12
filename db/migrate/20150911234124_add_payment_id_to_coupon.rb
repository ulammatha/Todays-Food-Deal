class AddPaymentIdToCoupon < ActiveRecord::Migration
  def change
    add_column :coupons, :payment_id, :integer, :null => false
  end
end
