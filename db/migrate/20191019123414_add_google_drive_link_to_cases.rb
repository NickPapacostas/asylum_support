class AddGoogleDriveLinkToCases < ActiveRecord::Migration[5.2]
  def change
    add_column :cases, :google_drive_link, :string
  end
end
