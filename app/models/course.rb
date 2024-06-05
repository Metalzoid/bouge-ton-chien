class Course < ApplicationRecord
  belongs_to :user, optional: true
  has_many_attached :photos

  has_many :reviews, dependent: :destroy
  has_many :rides

  validates :distance, presence: true, numericality: { only_float: true }
  validates :latitude, presence: true, numericality: { only_float: true }
  validates :longitude, presence: true, numericality: { only_float: true }
  validates :water, inclusion: { in: [true, false] }
  validates :trashs, inclusion: { in: [true, false] }
  validates :poopbag, inclusion: { in: [true, false] }
  validates :familyfriendly, inclusion: { in: [true, false] }
  validates :difficulty, presence: true, numericality: { only_integer: true, in: 0..5 }
  validates :description, presence: true
  validates :timing, presence: true

  def average
    result = 0
    reviews.each { |review| result += review.rating }
    result = result.fdiv(reviews.count) if reviews.count.positive?
    return result
  end
end
