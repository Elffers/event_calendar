class Event < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  has_many :users, through: :events_users
  has_many :events_users
  has_many :comments
  validates :name, presence: true
  validates :date, presence: true
  validates :description, presence: true

  def start_time
    date
  end
end
