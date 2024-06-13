class UserReward < ApplicationRecord
  belongs_to :user
  belongs_to :reward

  enum progress: {
    pending: 0,
    used: 1,
    expired: 2
  }

  def reduction_price
    if !reward.price.nil? && !reward.reduction.nil?
      if reward.reduction < 10
        return reward.price - ("0.0#{reward.reduction}".to_f * reward.price).round(2)
      else
        return reward.price - ("0.#{reward.reduction}".to_f * reward.price).round(2)
      end
    end
  end
end
