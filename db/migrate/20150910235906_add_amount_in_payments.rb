class AddAmountInPayments < ActiveRecord::Migration
  def up
    add_column :payments, :amount, :decimal,:precision => 8, :scale => 2
  end

  def down
    remove_column :payments, :amount
  end
end
