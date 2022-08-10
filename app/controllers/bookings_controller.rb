class BookingsController < ApplicationController
  before_action :set_boat, only: [:new, :create]
  def index
    # @booking = Booking.all
    @bookings = policy_scope(Booking)
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.boat = Boat.find(params[:boat_id])
    @booking.save
    authorize @booking
    redirect_to booking_path(@booking)
  end

  def edit
    @booking = Booking.find(booking_params)
    authorize @booking
  end

  def update
    @booking = Booking.find(booking_params)
    @booking.update(booking_params)
    redirect to booking_path(@booking)
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :boat_id)
  end

  def set_boat
    @boat = Boat.find(params[:boat_id])
  end
end
