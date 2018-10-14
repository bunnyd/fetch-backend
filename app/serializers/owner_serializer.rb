class OwnerSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :zip_code, :picture_url, :dogs, :meetups
  def dogs
    self.object.dogs.map do |dog|
      {
        id: dog.id,
        name: dog.name,
        breed: dog.breed,
        size: dog.size,
        sex: dog.sex,
        short_bio: dog.short_bio,
        picture_url: dog.picture_url
      }
    end
  end
  def meetups
    self.object.meetups.map do |meetup| {
      date: meetup.date,
      location_name: meetup.location_name,
      address: meetup.address,
      zip_code: meetup.zip_code,
      time: meetup.time
    }
    end
  end
end