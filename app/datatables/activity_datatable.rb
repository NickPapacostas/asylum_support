class ActivityDatatable < ApplicationDatatable

  def view_columns
    @view_columns ||= {
      updated_at: { source: "PublicActivity::Activity.updated_at", cond: :like, searchable: true, orderable: true },
      case_number: { source: "PublicActivity::Activity.trackable_id", searchable: true },
      activity_type:  { source: "PublicActivity::Activity.case_activity_type",  cond: :like, searchable: true, orderable: true },
      notes:  { source: "PublicActivity::Activity.notes",  cond: :like, searchable: true, orderable: true },
    }
  end


  def_delegators :@view, :link_to, :case_path

  def data
    records.map do |record|
      # case_number_link = link_to(record.trackable_id, case_path(record.trackable_id))
      {
        updated_at: record.updated_at,
        case_number: record.trackable_id,
        activity_type: record.case_activity_type,
        notes: record.notes
      }
    end
  end

  def get_raw_records
    PublicActivity::Activity.order(updated_at: :desc)
  end

end
