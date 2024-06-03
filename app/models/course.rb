class Course < ApplicationRecord
  belongs_to :user

  validates :distance, presence: true, numericality: { only_float: true }
  validates :latitude, presence: true, numericality: { only_float: true }
  validates :longitude, presence: true, numericality: { only_float: true }
  validates :water, inclusion: { in: [true, false] }
  validates :trashs, inclusion: { in: [true, false] }
  validates :poopbag, inclusion: { in: [true, false] }
  validates :familyfriendly, inclusion: { in: [true, false] }
  validates :difficulty, presence: true, numericality: { only_integer: true }
  validates :timing, presence: true
end
