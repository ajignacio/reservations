class BookingController < ApplicationController
  def index
    #raise params.inspect
    @date = params[:date].present? ? params[:date] : Date.today.strftime('%d/%m/%Y')
    @duration = params[:duration]#.present? ? params[:duration] : nil
    @time_start = params[:time_start]
    @book = Room.get_room_details(params[:book])
  end

  def build_reservation
    @room_reservation = RoomReservation.build_reservation(params)
    respond_to do |f|
      if @room_reservation.class != ActiveModel::Errors
          f.html { redirect_to root_url, success: "Success"}
      else
          @book = Room.find params[:rid].to_i
          #raise @room_reservation.inspect
          f.html { redirect_to booking_index_path(book: @book, date: params[:date], duration: params[:duration], time_start: params[:time_start]), alert: @room_reservation.full_messages}
      end
    end
  end

end
