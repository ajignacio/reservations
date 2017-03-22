class HomeController < ApplicationController
  def index
    @date = params[:date].present? ? params[:date].to_date : Date.today.strftime('%d/%m/%Y')
    @duration = params[:duration].present? ? params[:duration] : (Time.at(Time.parse("0:30").to_i).strftime("%H:%M"))
    @time_start = params[:time_start].present? ? params[:time_start] : (Time.at(Time.parse("08:00").to_i).strftime("%H:%M"))
    @room = Room.search(params)
  end
end
