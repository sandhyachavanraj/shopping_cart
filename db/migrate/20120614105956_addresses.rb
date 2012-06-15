class Addresses < ActiveRecord::Migration
  def up
    create_table :addresses do |t|
      t.references  :adr,:polymorphic => true
      t.integer :mobile_number
      t.integer :phone_number
      t.text :address
      t.timestamps
    end
  end

  def down
  end
end
