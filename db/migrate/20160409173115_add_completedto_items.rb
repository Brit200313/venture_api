class AddCompletedtoItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :completed, :string, default: false
  end
end
