class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user
      t.string :firstname
      t.string :lastname
      t.string :address_line1
      t.string :address_line2
      t.string :state
      t.string :country
      t.integer :zipcode
      t.decimal :amount
      t.timestamps
    end
  end
end
