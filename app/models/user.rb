class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo

  has_many :courses
  has_many :dogs, dependent: :destroy
  has_many :rides, dependent: :destroy
  has_many :user_rewards, dependent: :destroy
  has_many :reviews

  validates :nickname, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :money, presence: true, numericality: { only_integer: true }

  enum role: {
    user: 0,
    admin: 1
  }
end
