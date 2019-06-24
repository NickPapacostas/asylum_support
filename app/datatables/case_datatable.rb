class CaseDatatable < ApplicationDatatable
  def_delegator :@view, :link_to
  def_delegator :@view, :case_path

  def view_columns
    @view_columns ||= {
      number: { source: "Case.id", searchable: true, orderable: true },
      member_name: { source: "Member.first_name", cond: :like, searchable: true, orderable: true },
      member_dob: { source: "Member.date_of_birth", orderable: true },
      member_nationality: { source: "Member.nationality", orderable: true },
      member_case_number: { source: "Member.case_number", cond: :like, searchable: true, orderable: true },
      caseworker: { source: "Caseworker.first_name", cond: :like, searchable: true, orderable: true },
      last_updated: { source: "Case.updated_at" }
    }
  end

  def data
    records.map do |record|
      if member = record.lead_member
        member_name = member.full_name
        member_dob = member.display_birthdate
        member_nationality = member.nationality
        member_case_number = member.case_number
      end

      {
        # example:
        number: link_to(record.id, case_path(record.id)),
        member_name: link_to(member_name, case_path(record.id)),
        member_name: link_to(member_name, case_path(record.id)),
        member_dob: member_dob,
        member_nationality: member_nationality,
        member_case_number: member_case_number,
        caseworker: record.caseworker.try(:full_name),
        last_updated: record.updated_at.localtime.strftime("%A %B %d %H:%M"),
      }
    end
  end

  def get_raw_records
    lawyer_only = options[:lawyer] == "true"


    model = lawyer_only ? Case.where(lawyer: true) : Case.all

    if options[:active]
      active = options[:active] == "true"
      model = active ? model.where(active: true) : model.where(active: false)
    end

    model.includes(:members, :caseworker).references(:members) # .includes(:point_of_contact)
  end
end
