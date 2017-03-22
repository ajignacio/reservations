module BookingHelper

  def hourly_rate(rate,duration)
    total_seconds = Time.parse(duration).seconds_since_midnight
    #raise total_seconds.inspect
    total_minutes = total_seconds /  60
    ((total_minutes/60) * rate)
  end

end
