class DeleteDiscountFromDeal < ActiveRecord::Migration
  def up
    remove_column :deals, :discount
  end
  def down
    raise ActiveRecord::IrreversibleMigration, "Can't recover the deleted column"
  end
end
