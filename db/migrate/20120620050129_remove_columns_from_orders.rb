class RemoveColumnsFromOrders < ActiveRecord::Migration
  def up
#    remove_column :orders, :firstname, :lastname
    remove_column :orders, :address_line1, :address_line2, :state, :country, :zipcode
  end

  def down
    add_column :orders, :first_name, :string
    add_column :orders, :last_name, :string
  end
end
