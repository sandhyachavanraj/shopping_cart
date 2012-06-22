class Addcolumnstoadddress < ActiveRecord::Migration
  def up
    remove_column :addresses, :adr_id, :adr_type
    add_column :addresses, :address_type, :string
    add_column :addresses, :user_profile_id, :integer, :references => "user_profile"
  end

  def down

  end
end
