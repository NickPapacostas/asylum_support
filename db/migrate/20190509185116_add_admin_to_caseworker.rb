class AddAdminToCaseworker < ActiveRecord::Migration[5.2]
  def change
  	add_column :caseworkers, :admin, :boolean, default: false
  end
end
