class DogsController < ApplicationController
  def index
    @dogs = Dog.where(user: User.find(params[:user_id]))
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = User.find(params[:user_id])
    if @dog.save
      respond_to do |format|
        format.html { redirect_to user_dogs_path(current_user) }
        format.text { render partial: "dogs/dog", locals: { dog: @dog }, formats: [:html] }
      end
    else
      respond_to do |format|
        format.html { render :index }
      end
    end
  end

  def destroy
    @dog = Dog.find(params[:id])
    @dog.destroy
    redirect_to user_dogs_path(current_user)
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :race, :age, :photo)
  end
end
