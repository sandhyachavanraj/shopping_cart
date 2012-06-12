class Removecolumns < ActiveRecord::Migration
  def up
    remove_column :user_profiles, :billing_address
    remove_column :user_profiles, :permanent_address
    remove_column :user_profiles, :telephone_number
    remove_column :user_profiles, :mobile_number
  end

  def down
    add_column :user_profiles, :billing_address, :text
    add_column :user_profiles, :permanent_address, :text
    add_column :user_profiles, :telephone_number, :integer
    add_column :user_profiles, :mobile_number, :integer
  end
end
