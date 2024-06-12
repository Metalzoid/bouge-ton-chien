class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :course

  def rided_at
    updated_at.day < 10 ? day = "0#{updated_at.day}" : day = updated_at.day
    updated_at.month < 10 ? month = "0#{updated_at.month}" : month = updated_at.month
    return "#{day}/#{month}/#{updated_at.year}"
  end
end
