class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :user_id
      t.integer :deal_id
      t.string :stripe_token
      t.boolean :transaction_status
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
