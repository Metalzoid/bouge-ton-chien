class Review < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :rating, presence: true, numericality: { only_integer: true, in: 0..5 }
  validates :comment, presence: true
end
