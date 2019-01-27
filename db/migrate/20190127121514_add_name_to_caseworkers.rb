class AddNameToCaseworkers < ActiveRecord::Migration[5.2]
  def change
  	add_column :caseworkers, :first_name, :string
  	add_column :caseworkers, :last_name, :string
  end
end
