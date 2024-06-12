class CoursesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @courses = Course.all.includes(:reviews).sort_by(&:average).reverse
  end

  def filter
    @courses = Course.all
    if params[:filter]
      Course::CATEGORIES.each do |category|
        @courses = @courses.where(category => true) if params[:filter][category] && params[:filter][category] == "1"
      end
      @courses = @courses.select { |course| current_user.favouritescourses.include?(course) } if params[:filter]['favourites'].to_i == 1
      @courses_filtered = []
      if params[:filter]['distance']
        @courses.each do |course|
          params[:filter]['distance'].gsub(" Km", "") == 5 ? lat_plus = (course.latitude + ("0.0#{params[:filter]['distance'].gsub(" Km", "")}".to_f / 2)).round(3) : lat_plus = (course.latitude + ("0.#{params[:filter]['distance'].gsub(" Km", "")}".to_f / 2)).round(3)
          params[:filter]['distance'].gsub(" Km", "") == 5 ? lat_moins = (course.latitude - ("0.0#{params[:filter]['distance'].gsub(" Km", "")}".to_f / 2)).round(3) : lat_moins = (course.latitude - ("0.#{params[:filter]['distance'].gsub(" Km", "")}".to_f / 2)).round(3)
          params[:filter]['distance'].gsub(" Km", "") == 5 ? lng_plus = (course.longitude + ("0.0#{params[:filter]['distance'].gsub(" Km", "")}".to_f / 2)).round(3) : lng_plus = (course.longitude + ("0.#{params[:filter]['distance'].gsub(" Km", "")}".to_f / 2)).round(3)
          params[:filter]['distance'].gsub(" Km", "") == 5 ? lng_moins = (course.longitude - ("0.0#{params[:filter]['distance'].gsub(" Km", "")}".to_f / 2)).round(3) : lng_moins = (course.longitude - ("0.#{params[:filter]['distance'].gsub(" Km", "")}".to_f / 2)).round(3)
          user_latitude = params[:filter]['user_latitude'].to_f.round(3)
          user_longitude = params[:filter]['user_longitude'].to_f.round(3)
          if user_latitude <= lat_plus && user_latitude >= lat_moins && user_longitude <= lng_plus && user_longitude >= lng_moins
            @courses_filtered << course
          end
        end
      else
        @courses_filtered = @courses
      end
      @courses_filtered = @courses_filtered.sort_by(&:average).reverse
      respond_to do |format|
        format.html
        format.text { render partial: "courses/list", locals: { courses: @courses_filtered }, formats: [:html] }
      end
    end
  end

  def show
    @course = Course.find(params[:id])
    @reviews = @course.reviews.includes(:user)
  end
end
