class DogsController < ApplicationController
  def index
    @dogs = Dog.where(user: User.find(params[:user_id]))
  end

  def destroy
    @dog = Dog.find(params[:id])
    @dog.destroy
    redirect_to user_dogs_path(current_user)
  end
end
