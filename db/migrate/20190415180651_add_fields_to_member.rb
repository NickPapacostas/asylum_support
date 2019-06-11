class AddFieldsToMember < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :case_number, :string
    add_column :members, :date_of_birth, :timestamp
    add_column :members, :nationality, :string
    add_column :members, :gender, :string
    add_column :members, :language, :string
    add_column :members, :arrival_date, :timestamp
    add_column :members, :arrival_location, :string
    add_column :members, :regional_asylum_office, :string
    add_column :members, :geographic_restriction, :boolean, default: false
    add_column :members, :legal_status, :string, array: true, default: []
    add_column :members, :vulnerabilities, :string, array: true, default: []
    add_column :members, :housing, :string, array: true, default: []
  end
end
