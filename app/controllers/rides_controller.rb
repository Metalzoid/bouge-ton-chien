class RidesController < ApplicationController
  def create
    if params[:near] == "true"
      @ride = Ride.new(user: current_user, course: Course.find(params[:course_id]), money: 0)
      @ride.save
      redirect_to edit_ride_path(@ride)
    else
      redirect_to navigate_path(course_id: params[:course_id])
    end
  end

  def edit
    @ride = Ride.find(params[:id])
    # if @ride.timing
    #   flash[:alert] = "Impossible de modifier une ride !"
    #   redirect_to root_path
    # end
  end

  def show
  end

  def map
    @markers = Course.all.map do |course|
      {
        lat: course.latitude,
        lng: course.longitude
      }
    end
  end

  def navigate
    @course = Course.find(params[:course_id])
  end
end
