class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :user
      t.integer :mobile_number
      t.integer :phone_number
      t.string :type_of_address
      t.text :address
      t.timestamps
    end
  end
end
