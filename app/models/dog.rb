class Dog < ApplicationRecord
  belongs_to :owner

  validates :name, :sex, :short_bio, presence: true
  has_one_attached :image

end
