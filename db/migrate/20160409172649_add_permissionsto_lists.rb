class AddPermissionstoLists < ActiveRecord::Migration[5.0]
  def change
    add_column :lists, :permission, :string, default: "public"
  end
end
