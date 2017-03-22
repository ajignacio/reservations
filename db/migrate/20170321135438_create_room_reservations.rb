class CreateRoomReservations < ActiveRecord::Migration
  def change
    create_table :room_reservations do |t|
      t.references :room, index: true, foreign_key: true
      t.date :reserve_date
      t.time :time_start
      t.time :time_out
      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :email
      t.string :status, default: "pending"

      t.timestamps null: false
    end
  end
end
