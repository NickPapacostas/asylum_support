class AddLeadCaseMemberToMember < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :lead_case_member, :boolean, default: false
  end
end
