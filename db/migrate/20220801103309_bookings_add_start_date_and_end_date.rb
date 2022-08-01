class BookingsAddStartDateAndEndDate < ActiveRecord::Migration[7.0]
  def change
    rename_column :bookings, :date, :start_date
    add_column :bookings, :end_date, :date
  end
end
