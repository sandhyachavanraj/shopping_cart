class Addstockkeepingunittoproduct < ActiveRecord::Migration
  def change
    add_column :products, :stock_keeping_unit, :integer
  end
end
