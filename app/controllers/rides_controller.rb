class RidesController < ApplicationController
  before_action :set_ride, only: %i[edit update show]
  before_action :set_user, only: [:index]

  def create
    if params[:near] == "true"
      @ride = Ride.new(user: current_user, course: Course.find(params[:course_id]), money: 0)
      @ride.save
      redirect_to edit_ride_path(@ride)
    else
      redirect_to course_navigate_path
    end
  end

  def edit
    if @ride.timing
      flash[:alert] = "Impossible de modifier une ride !"
      redirect_to root_path
    end
  end

  def update
    @ride.money = @ride.course.money
    @ride.timing = params[:ride][:timing]
    @ride.distance = @ride.course.distance
    @ride.save
    current_user.update(money: current_user.money += @ride.money)
    redirect_to ride_path(@ride)
  end

  def show
    @ride = Ride.find(params[:id])
    @review = Review.new
  end

  def map
    @markers = Course.all.map do |course|
      {
        lat: course.latitude,
        lng: course.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { course: course })
      }
    end
  end

  def navigate
    @course = Course.find(params[:course_id])
  end

  def index
    @rides = current_user.rides.sort_by(&:updated_at).reverse
  end

  private

  def set_ride
    @ride = Ride.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
