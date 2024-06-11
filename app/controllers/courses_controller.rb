class CoursesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @courses = Course.all
  end

  def filter
    @courses = Course.all
    if params[:filter]
      Course::CATEGORIES.each do |category|
        @courses = @courses.where(category => true) if params[:filter][category] && params[:filter][category] == "1"
      end
      respond_to do |format|
        format.html # Follow regular flow of Rails
        format.text { render partial: "courses/list", locals: { courses: @courses }, formats: [:html] }
      end
    end
  end

  def show
    @course = Course.find(params[:id])
    @reviews = @course.reviews.includes(:user)
  end
end
