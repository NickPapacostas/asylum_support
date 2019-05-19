class CreateCaseCasewokers < ActiveRecord::Migration[5.2]
  def change
    create_table :case_caseworkers do |t|
    	t.references :case, null: false
    	t.references :caseworker, null: false
    	t.boolean :lead_caseworker, default: false
    	t.timestamps
    end
  end
end
