class ChangeDealColumns < ActiveRecord::Migration
  def up
    remove_column :deals, :coupon_code
    rename_column :deals, :recipe_name, :name

  end
  def down
    raise ActiveRecord::IrreversibleMigration, "Can't recover the deleted/renamed columns"
  end
end
