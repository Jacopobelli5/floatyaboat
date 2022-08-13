class ReviewsController < ApplicationController
  before_action :set_boat, only: [ :new, :create, :update, :show ]

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.boat = Boat.find(params[:boat_id])
    @review.save
    redirect_to boat_path(@boat)
    authorize @review
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_boat
    @boat = Boat.find(params[:boat_id])
  end
end
