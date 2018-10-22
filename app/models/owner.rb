class Owner < ApplicationRecord
  has_many :dogs
  validates :first_name, :last_name, :email, :zip_code, presence: true
  validates :email, :presence => true, :uniqueness => true

  has_secure_password

  has_many :owner_meetups
  has_many :meetups, through: :owner_meetups

  accepts_nested_attributes_for :meetups

  has_one_attached :image

  def full_name
    "#{first_name} #{last_name}"
  end
end
