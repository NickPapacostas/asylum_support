class AddTagsToCases < ActiveRecord::Migration[5.2]
  def change
    add_column :cases, :tags, :string, array: true, default: []
  end
end