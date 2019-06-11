class AddActiveToCases < ActiveRecord::Migration[5.2]
  def change
    add_column :cases, :active, :boolean, default: true
  end
end
