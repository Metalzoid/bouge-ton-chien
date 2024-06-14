class Course < ApplicationRecord
  CATEGORIES = %i[water trashs poopbag familyfriendly]

  belongs_to :user, optional: true
  has_many_attached :photos

  has_many :reviews, dependent: :destroy
  has_many :rides, dependent: :destroy
  has_many :favourites, dependent: :destroy

  validates :distance, presence: true, numericality: { only_float: true }
  validates :latitude, presence: true, numericality: { only_float: true }
  validates :longitude, presence: true, numericality: { only_float: true }
  validates :water, inclusion: { in: [true, false] }
  validates :trashs, inclusion: { in: [true, false] }
  validates :poopbag, inclusion: { in: [true, false] }
  validates :familyfriendly, inclusion: { in: [true, false] }
  validates :difficulty, presence: true, numericality: { only_integer: true, in: 0..5 }
  validates :money, presence: true, numericality: { only_integer: true }
  validates :description, presence: true
  validates :timing, presence: true

  def average
    result = 0
    # reviews.each { |review| result += review.rating }
    result += reviews.sum(&:rating)
    result = result.fdiv(reviews.count) if reviews.count.positive?
    return result
  end

  def geojson
    access_token = ENV['MAPBOX_API_KEY']
    geojson = {
      type: "FeatureCollection",
      features: [
        {
          type: "Feature",
          properties: {},
          geometry: {
            type: "LineString",
            coordinates: route
          }
        }
      ]
    }.to_json
    encoded_geojson = URI.encode_www_form_component(geojson)
    return "https://api.mapbox.com/styles/v1/mapbox/streets-v12/static/geojson(#{encoded_geojson})/auto/150x300?access_token=#{access_token}"
  end
end
