class RidesController < ApplicationController
  def create
    @ride = Ride.new(user: current_user, course: Course.find(params[:course_id]), money: 0)
    @ride.save
    redirect_to edit_ride_path(@ride)
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
    @markers = []
    Course.all.each do |course|
      @markers << { lat: course.latitude, lng: course.longitude }
    end
  end
end
