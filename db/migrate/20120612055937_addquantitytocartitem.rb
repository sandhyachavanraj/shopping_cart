class Addquantitytocartitem < ActiveRecord::Migration
 def change
    add_column :cart_items, :quantity, :integer
  end
end
