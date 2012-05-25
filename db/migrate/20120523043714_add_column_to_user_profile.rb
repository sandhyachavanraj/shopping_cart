class AddColumnToUserProfile < ActiveRecord::Migration
  def change
    add_column :userprofiles, :comment, :string
    add_column :userprofiles, :name, :string
    add_column :userprofiles, :content_type, :string
    add_column :userprofiles, :data, :binary
  end
end
