class AddDefaultToUserRewardProgress < ActiveRecord::Migration[7.1]
  def change
    change_column_default :user_rewards, :progress, 0
  end
end
