class Review < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :course
  has_many_attached :photos

  validates :rating, presence: true, numericality: { only_integer: true, in: 0..5 }
  validates :comment, presence: true
end
