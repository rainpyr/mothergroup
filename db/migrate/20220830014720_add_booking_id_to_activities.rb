class AddBookingIdToActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :booking_id, :integer
  end
end
