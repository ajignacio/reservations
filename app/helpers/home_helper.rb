module HomeHelper
  def select_hour
    from = Time.parse("0:30").to_i
    to = Time.parse("8:00").to_i
    date = []
    (from..to).step(1800).each do |h|
    	date << [(Time.at(h).strftime("%k:%M")),(Time.at(h).strftime("%H:%M"))]
    end
    date
  end

  def select_time_to_start
    from = Time.parse("8:00").to_i
    to = Time.parse("17:00").to_i
    date = []
    (from..to).step(1800).each do |h|
      puts Time.at(h).strftime("%H:%M")
      if Time.at(Time.parse("12:30").to_i).strftime("%H:%M") != Time.at(h).strftime("%H:%M")
        date << [(Time.at(h).strftime("%H:%M %p")),(Time.at(h).strftime("%H:%M"))]
      end
    end
    date
  end


end
