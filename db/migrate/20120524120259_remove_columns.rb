class RemoveColumns < ActiveRecord::Migration
  def up
    remove_column :user_profiles, :data
    remove_column :user_profiles, :name
    remove_column :user_profiles, :comment
    remove_column :user_profiles, :image
  end

  def down
     add_column :user_profiles, :data, :binary
     add_column :user_profiles, :name, :string
     add_column :user_profiles, :comment, :string
     add_column :user_profiles, :image, :binary
  end
end
