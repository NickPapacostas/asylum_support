class CaseDatatable < ApplicationDatatable
  def_delegator :@view, :link_to
  def_delegator :@view, :case_path


  def view_columns
    @view_columns ||= {
      number: { source: "Case.id", searchable: true, orderable: true },
      member_name: { source: "Member.first_name", cond: :like, searchable: true, orderable: true },
      caseworker:  { source: "Caseworker.last_name",  cond: :like, searchable: true, orderable: true },
      last_updated:  { source: "Case.updated_at"}
    }
  end


  def data
    records.map do |record|
      member_name = record.members.last.try(:full_name)

      {
        # example:
        number: link_to(record.id, case_path(record.id)),
        member_name: member_name,
        caseworker: record.caseworker.full_name,
        last_updated: record.updated_at.localtime.strftime("%A %B %d %H:%M"),
      }
    end
  end

  def get_raw_records
    # insert query here
    Case.all.includes(:members, :caseworker).references(:members) #.includes(:point_of_contact)
  end

end
