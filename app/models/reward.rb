class Reward < ApplicationRecord
  has_one_attached :photo
  has_many :user_rewards

  validates :price, presence: true, numericality: { only_integer: true }
  validates :name, presence: true
  validates :link, presence: true
end
