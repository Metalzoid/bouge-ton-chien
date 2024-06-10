class ReviewsController < ApplicationController
  def create
    @review = Review.new(params[:review])
    @review.save
  end
end
