class AddDurationToRoomReservations < ActiveRecord::Migration
  def change
    add_column :room_reservations, :duration, :time
  end
end
