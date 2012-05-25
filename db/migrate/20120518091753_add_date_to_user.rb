class AddDateToUser < ActiveRecord::Migration
  def change
    add_column :users, :date, :date
  end
end
