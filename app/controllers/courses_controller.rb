class CoursesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @courses = Course.all
    if params[:filter]
      Course::CATEGORIES.each do |category|
        @courses = @courses.where(category => true) if params[:filter][category] && params[:filter][category] == "1"
      end
    end
  end

  def show
    @course = Course.find(params[:id])
    @reviews = @course.reviews.includes(:user)
  end
end
