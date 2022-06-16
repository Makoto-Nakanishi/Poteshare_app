class AddColumnsToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :started_at, :datetime
    add_column :reservations, :ended_at, :datetime
    add_column :reservations, :people_number, :integer
  end
end
