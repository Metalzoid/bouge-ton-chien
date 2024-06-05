class Dog < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :race, presence: true
  validates :age, presence: true, numericality: { only_integer: true }
  validates :photo, presence: true
  has_one_attached :photo
end
