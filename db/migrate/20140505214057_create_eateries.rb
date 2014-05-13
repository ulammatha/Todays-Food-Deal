class CreateEateries < ActiveRecord::Migration
  def change
    create_table :eateries do |t|
      t.string :eatery_name
      t.string :eatery_description
      t.string :eatery_contact
      t.string :eatery_email
      t.string :eatery_address
      t.integer :customer_rating
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
