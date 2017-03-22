class RoomReservation < ActiveRecord::Base

  validates :first_name, :last_name, :email, :company, presence: true
  validates :email, format: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  belongs_to :room

  def self.build_reservation(data)
    begin
      self.create!(self.reservation_fields(data))
    rescue ActiveRecord::RecordInvalid => invalid
      return invalid.record.errors
    end
  end

  def self.reservation_fields(data)
    #raise data.inspect
    {
      room_id: data[:rid],
      reserve_date: data[:date],
      duration: DateTime.parse(data[:duration]),
      time_start: DateTime.parse(data[:time_start]),
      first_name: data[:first_name],
      last_name: data[:last_name],
      company: data[:company],
      email: data[:email],
      status: "reserved"
    }
  end

  def self.get_reserve_data
    reserve = self.where('reserve_date >= ?',Date.today)
    data = []
    reserve.each do |r|
      data <<
      {
        room: r.room.name,
        capacity:r.room.capacity,
        reserve_date: r.reserve_date.strftime("%m/%d/%Y"),
        time_start: r.time_start.strftime("%H:%M %p"),
        duration: r.duration.strftime("%H:%M"),
        rate: r.room.rate_per_hour,
        name: r.full_name,
        company: r.company
      }
    end
    data
  end


def full_name
  self.first_name + " " + self.last_name
end

end
