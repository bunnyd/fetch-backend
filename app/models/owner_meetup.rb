class OwnerMeetup < ApplicationRecord
  belongs_to :owner
  belongs_to :meetup
  validates :owner, :meetup, presence: true
end
