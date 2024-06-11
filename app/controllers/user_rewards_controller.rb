class UserRewardsController < ApplicationController
  def index
    @user_rewards = UserReward.where(user_id: params[:user_id])
  end

  def create
    @user_reward = UserReward.new(user_reward_params)
    if @user_reward.reward.money <= current_user.money
      current_user.update(money: current_user.money -= @user_reward.reward.money)
      @user_reward.save
      redirect_to user_user_rewards_path(user_id: current_user.id)
    end
  end

  private

  def user_reward_params
    params.require(:user_reward).permit(:user_id, :reward_id)
  end
end
