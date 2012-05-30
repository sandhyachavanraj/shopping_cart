class AddCartItemIdToProduct < ActiveRecord::Migration
  def change
    add_column :products, :cart_item_id, :integer
  end
end
