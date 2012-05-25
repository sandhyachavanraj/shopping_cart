class AddImageUrlToUserProfile < ActiveRecord::Migration
  def change
    add_column :user_profiles, :image_url, :string
  end
end
