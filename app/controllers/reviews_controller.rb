class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @ride = Ride.find(params[:ride_id])
    @review.course = @ride.course
    @review.rating = 0 if params[:review]['rating'].nil?
    @review.save
    redirect_to ride_path(@ride)
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

end
