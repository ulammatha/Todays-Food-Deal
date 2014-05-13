class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.integer :rank
      t.string :recipe_name
      t.string :description
      t.decimal :current_amount, :precision => 8, :scale => 2
      t.decimal :previous_amount, :precision => 8, :scale => 2
      t.decimal :discount, :precision => 8, :scale => 2
      t.datetime :expiry
      t.string :coupon_code
      t.integer :available_coupons
      t.integer :sold_coupons
      t.integer :eatery_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
    add_index :deals, :rank
    add_index :deals, :eatery_id
  end
end
