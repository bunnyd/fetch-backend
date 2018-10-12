class Owner < ApplicationRecord
  has_many :dogs
  validates :first_name, :last_name, :email, :zip_code, presence: true

  has_secure_password

  has_many :owner_meetups
  has_many :meetups, through: :owner_meetups

  def full_name
    "#{first_name} #{last_name}"
  end
end
