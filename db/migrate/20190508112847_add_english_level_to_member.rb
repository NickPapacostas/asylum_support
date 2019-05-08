class AddEnglishLevelToMember < ActiveRecord::Migration[5.2]
  def change
  	add_column :members, :english_level, :string
  end
end
