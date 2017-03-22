class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :capacity
      t.float :rate_per_hour, scale: 2
      t.integer :unit, default: 1

      t.timestamps null: false
    end
  end
end
