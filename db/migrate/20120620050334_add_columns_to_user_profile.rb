class AddColumnsToUserProfile < ActiveRecord::Migration
  def change
    add_column :user_profiles, :first_name, :string
    add_column :user_profiles, :last_name, :string
  end
end

