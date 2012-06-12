class Changeproductscolumn < ActiveRecord::Migration
  def up
    rename_column :products, :quantity, :stock_keeping_unit
  end

  def down
    remove_column :products, :quantity, :integer
  end
end
