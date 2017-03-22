class ReservesController < ApplicationController
  def index
    @reserve = RoomReservation.get_reserve_data
    #raise @reserve.inspect
  end
end
