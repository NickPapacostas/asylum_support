class AddLawyerCase < ActiveRecord::Migration[5.2]
  def change
    add_column :cases, :lawyer, :boolean, default: false
  end
end
