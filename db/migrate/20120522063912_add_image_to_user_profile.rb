class AddImageToUserProfile < ActiveRecord::Migration
  def change
    add_column :userprofiles, :image, :binary
  end
end
