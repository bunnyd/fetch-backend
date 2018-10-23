class OwnerSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :title, :last_name, :email, :zip_code, :picture_url, :dogs, :meetups, :jwt

  def picture_url
    return "bug in OwnerSerializer" unless instance_options[:get_image_url]

    # Inside of here, we're accessing the `get_image_url` key-value pair
    # that we passed to the serializer and `call`ing the callback with
    # the object's actual image object
    @image_cb = instance_options[:get_image_url]
    @image_cb.call(@object.image)
  end

  def jwt
    return "bug in OwnerSerializer" unless instance_options[:get_token]

    instance_options[:get_token].call(@object.id)
  end

  def dogs
    @object.dogs.map do |dog|
      DogSerializer.new(dog, get_image_url: @image_cb)
    end
  end

  def meetups
    self.object.meetups.map do |meetup| {
      date: meetup.date,
      location_name: meetup.location_name,
      address: meetup.address,
      zip_code: meetup.zip_code,
      time: meetup.time,
      picture_url: meetup.picture_url,
      url:
      meetup.url
    }
    end
  end
end
