class UserReward < ApplicationRecord
  belongs_to :user
  belongs_to :reward

  enum progress: {
    pending: 0,
    used: 1,
    expired: 2
  }
end
