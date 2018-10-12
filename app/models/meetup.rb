class Meetup < ApplicationRecord
  has_many :owner_meetups
  has_many :owners, through: :owner_meetups
  validates :date, :address, :location_name, :zip_code, :time, presence: true
end
