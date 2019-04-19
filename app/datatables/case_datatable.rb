class CaseDatatable < ApplicationDatatable

  def view_columns
    @view_columns ||= {
      number: { source: "Case.id", searchable: true, orderable: true },
      first_name: { source: "Member.first_name", cond: :like, searchable: true, orderable: true },
      last_name:  { source: "Member.last_name",  cond: :like, searchable: true, orderable: true },
      caseworker:  { source: "Caseworker.last_name",  cond: :like, searchable: true, orderable: true },
      last_updated:  { source: "Case.updated_at",  cond: :like }
    }
  end


  def_delegators :@view, :link_to

  def data
    records.map do |record|
      first_name = record.members.first.try(:first_name)
      last_name = record.members.first.try(:last_name)

      {
        # example:
        number: record.id,
        first_name: first_name,
        last_name: last_name,
        caseworker: record.caseworker.full_name,
        last_updated: record.updated_at,
      }
    end
  end

  def get_raw_records
    # insert query here
    puts
    Case.all.includes(:members, :caseworker).references(:members) #.includes(:point_of_contact)
  end

end
