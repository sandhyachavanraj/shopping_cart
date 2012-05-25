class CreateUserprofiles < ActiveRecord::Migration
  def change
    create_table :userprofiles do |t|
      t.references :user
      t.text :billing_address
      t.text :perminent_address
      t.integer :telephone_number
      t.integer :mobile_number
      t.binary :image
      t.timestamps
    end
  end
end
