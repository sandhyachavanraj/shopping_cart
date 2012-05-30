class AddProductIdToCartItems < ActiveRecord::Migration
  def change
    add_column :cart_items, :product_id, :integer
  end
end
