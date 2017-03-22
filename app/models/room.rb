class Room < ActiveRecord::Base

  has_many :room_reservations

  def self.search(search)

    pax = search[:capacity]
    date = search[:date].present? ? search[:date].to_date : Date.today
    room = search[:capacity].present? ? self.where(capacity: pax) : self.all
    if search[:duration].present?
      duration = Time.parse(search[:duration]).seconds_since_midnight
      total_minutes = duration /  60
      over = Time.parse(search[:time_start]) + total_minutes.minute
      #raise (over.strftime("%H:%M") >= Time.parse("17:00").strftime("%H:%M")).inspect
      if (over.strftime("%H:%M") >= Time.parse("17:00").strftime("%H:%M"))
        #raise "wrong".inspect
        return false
      end
    end
    data = []
    room.each do |r|
      reservation = r.room_reservations.where(reserve_date: date)
      #raise date.inspect
      if reservation.count < r.unit
        data << {
          id: r.id,
          name: r.name,
          capacity: r.capacity,
          rate: r.rate_per_hour,
          available: "#{reservation.count}/#{r.unit}"
        }
      end
    end
    data
  end

  def self.get_room_details(id)
    details = self.find id
    details
  end
end
