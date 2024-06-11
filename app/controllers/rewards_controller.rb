class RewardsController < ApplicationController
  def index
    @rewards = Reward.all
    @user_reward = UserReward.new
  end
end
