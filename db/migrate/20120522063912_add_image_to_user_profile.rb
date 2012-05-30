class AddImageToUserProfile < ActiveRecord::Migration
  def change
    add_column :user_profiles, :image, :binary
  end
end
