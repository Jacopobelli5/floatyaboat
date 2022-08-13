class BoatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_boat, only: [:show, :destroy, :edit, :update]

  def index
    @boats = policy_scope(Boat)
    if params[:query].present?
      @boats = Boat.where("address ILIKE ?", "%#{params[:query]}%")
    else
      # @boats = Boat.all
      @boats = policy_scope(Boat)
    end
    @markers = @boats.geocoded.map do |boat|
      {
        lat: boat.latitude,
        lng: boat.longitude,
        info_window: render_to_string(partial: "info_window", locals: { boat: boat })
      }
    end
  end

  def show
    @booking = Booking.new
    authorize @booking
  end

  def new
    @boat = Boat.new
    authorize @boat
  end

  def create
    @boat = Boat.new(boat_params)
    @boat.user = current_user
    authorize @boat
    if @boat.save
      redirect_to boat_path(@boat)
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @boat.update(boat_params)
      redirect_to boat_path(@boat), notice: "Boat listing succesfully updated"
    else
      render "edit"
    end
  end

  def destroy
    @boat.destroy
    redirect_to boats_path, status: :see_other
  end

  private

  def boat_params
    params.require(:boat).permit(:name, :boat_type, :address, :price, :description, photos: [])
  end

  def set_boat
    @boat = Boat.find(params[:id])
    authorize @boat
  end
end
