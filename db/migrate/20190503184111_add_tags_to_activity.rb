class AddTagsToActivity < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :tags, :string, array: true, default: []
  end
end
