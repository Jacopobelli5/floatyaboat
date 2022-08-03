class BoatsController < ApplicationController
  before_action :set_boat, only: [:show, :destroy] # <- optional addd :edit and :update
  def index
    @boats = Boat.all
  end

  def show
  end

  def new
    @boat = Boat.new
  end

  def create
    @boat = Boat.new(boat_params)
    if @boat.save
      redirect_to boat_path(@boat)
    else
      render "new"
    end
  end

  # Optional actions

  # def edit
  # end

  # def update
  # @boat.update(boat_params)
  # redirect_to boat_path(@boat)
  # end

  def destroy
    @boat.destroy
    redirect_to boats_path, status: :see_other
  end

  private

  def boat_params
    params.require(:boat).permit(:name, :boat_type, :address, :price, :description)
  end

  def set_boat
    @boat = Boat.find(params[:id])
  end
end
