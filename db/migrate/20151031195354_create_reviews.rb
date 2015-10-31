class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :deal_id, null: false
      t.integer :user_id, null: false
      t.integer :rating, null: false
      t.text :comment

      t.timestamps null: false
    end
  end
end
