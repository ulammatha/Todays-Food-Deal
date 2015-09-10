class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :code
      t.integer :user_id
      t.integer :deal_id

      t.timestamps
    end
  end
end
