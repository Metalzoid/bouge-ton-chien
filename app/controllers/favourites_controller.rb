class FavouritesController < ApplicationController
  def add_favourite(course_id)
    @favourite = Favourite.new
    @favourite.user = current_user
    @favourite.course_id = course_id
    @favourite.save
  end

  def destroy_favourite(course_id)
    Favourite.find_by(course_id: course_id, user: current_user).destroy
  end
end
