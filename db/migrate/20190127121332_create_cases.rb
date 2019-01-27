class CreateCases < ActiveRecord::Migration[5.2]
  def change
    create_table :cases do |t|
    	t.references :caseworker, null: false
    	t.timestamps
    end
  end
end
