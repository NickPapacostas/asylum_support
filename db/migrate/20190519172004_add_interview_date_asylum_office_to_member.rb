class AddInterviewDateAsylumOfficeToMember < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :interview_date, :date
    add_column :members, :appeal_date, :date
    add_column :members, :amka, :boolean
    add_column :members, :afm, :boolean
    add_column :members, :bank_account, :boolean
    change_column :members, :arrival_date, :date
  end
end
