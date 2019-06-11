class AddRelevantFutureDateToActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :relevant_future_datetime, :timestamp
  end
end
