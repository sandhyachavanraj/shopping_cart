class AddColumnToUserProfile < ActiveRecord::Migration
  def change
    add_column :user_profiles, :comment, :string
    add_column :user_profiles, :name, :string
    add_column :user_profiles, :content_type, :string
    add_column :user_profiles, :data, :binary
  end
end
