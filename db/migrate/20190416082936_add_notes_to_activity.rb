class AddNotesToActivity < ActiveRecord::Migration[5.2]
  def change
  	add_column :activities, :case_activity_type, :string
  	add_column :activities, :notes, :text
  end
end
