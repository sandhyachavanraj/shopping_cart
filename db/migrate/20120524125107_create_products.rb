class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :category
      t.string :name
      t.float :price, :precision => 5, :scale => 2
      t.text :description      
      t.timestamps
    end
  end
end
