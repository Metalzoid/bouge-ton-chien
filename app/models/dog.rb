class Dog < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :race, presence: true
  validates :age, presence: true, numericality: { only_integer: true }
end
