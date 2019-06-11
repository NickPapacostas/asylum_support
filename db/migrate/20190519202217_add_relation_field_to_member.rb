class AddRelationFieldToMember < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :relation, :string
  end
end
