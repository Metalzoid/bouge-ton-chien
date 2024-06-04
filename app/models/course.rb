class Course < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :distance, presence: true, numericality: { only_float: true }
  validates :latitude, presence: true, numericality: { only_float: true }
  validates :longitude, presence: true, numericality: { only_float: true }
  validates :water, inclusion: { in: [true, false] }
  validates :trashs, inclusion: { in: [true, false] }
  validates :poopbag, inclusion: { in: [true, false] }
  validates :familyfriendly, inclusion: { in: [true, false] }
  validates :difficulty, presence: true, numericality: { only_integer: true, in: 0..5 }
  validates :timing, presence: true

  def average
    result = 0
    reviews.each { |review| result += review.rating }
    result = result.fdiv(reviews.count) if reviews.count.positive?
    return result
  end
end
