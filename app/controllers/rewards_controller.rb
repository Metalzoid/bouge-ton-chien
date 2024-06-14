class RewardsController < ApplicationController
  def index
    @rewards = Reward.all.order(:money)
    @user_reward = UserReward.new
  end
end
