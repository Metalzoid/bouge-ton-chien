class FavouritesController < ApplicationController
  def create
    @favourite = Favourite.new
    @favourite.user = current_user
    @favourite.course_id = params[:course_id]
    @favourite.save
    redirect_to root_path
  end

  def destroy
    Favourite.find_by(course_id: params[:course_id], user: current_user).destroy
    redirect_to root_path
  end
end
