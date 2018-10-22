class DogSerializer < ActiveModel::Serializer
  attributes :id, :name, :breed, :size, :sex, :age, :short_bio, :picture_url, :owner_id

  def picture_url
    return "bug in DogSerializer" unless instance_options[:get_image_url]
    # Inside of here, we're accessing the `get_image_url` key-value pair
    # that we passed to the serializer and `call`ing the callback with
    # the object's actual image object
    instance_options[:get_image_url].call(@object.image)
  end
end
