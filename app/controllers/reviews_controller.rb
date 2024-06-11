class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.course = Ride.find(params[:ride_id]).course
    @review.save
    redirect_to root_path
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

end
