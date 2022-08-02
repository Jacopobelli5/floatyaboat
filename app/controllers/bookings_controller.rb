class BookingsController < ApplicationController

  def new
    @booking = Booking.all
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user # helper from devise gem
    @booking.boat = Boat.find(params[boat_id])
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render "new"
    end
  end

  def edit
    @booking = Booking.find(booking_params)
  end

  def update
    @booking = Booking.find(booking_params)
    @booking.update(booking_params)
    redirect to booking_path(@booking)
  end

  def show
    @boat = Boat.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
