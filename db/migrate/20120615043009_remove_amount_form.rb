class RemoveAmountForm < ActiveRecord::Migration
  def up
    remove_column :orders, :amount
  end

  def down
    add_column :orders, :amount, :decimal, :scale => 2, :precision => 9, :default => 0.0
  end
end
