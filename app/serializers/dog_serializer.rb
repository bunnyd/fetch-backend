class DogSerializer < ActiveModel::Serializer
  attributes :id, :name, :breed, :size, :sex, :age, :short_bio, :picture_url, :owner_id
end
